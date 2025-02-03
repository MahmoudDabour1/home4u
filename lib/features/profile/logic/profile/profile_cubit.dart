import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:home4u/features/profile/data/repos/profile_repo.dart';
import 'package:home4u/features/profile/logic/profile/profile_state.dart';
import 'package:home4u/features/profile/data/models/profile/profile_response_model.dart';
import 'package:home4u/core/utils/app_constants.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  final Box<ProfileResponseModel> profileBox;

  ProfileCubit(this._profileRepo, this.profileBox) : super(const ProfileState.initial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  Future<void> getProfileData() async {
    emit(const ProfileState.loadingProfileData());
    final cachedProfile = profileBox.get(kProfileData);
    if (cachedProfile != null) {
      emit(ProfileState.successProfileData(cachedProfile));
      return;
    }
    final response = await _profileRepo.getEngineerByToken();
    response.when(
      success: (profileData) async {
        await profileBox.put(kProfileData, profileData);
        emit(ProfileState.successProfileData(profileData));
      },
      failure: (error) {
        emit(ProfileState.errorProfileData(error: error.message.toString()));
      },
    );
  }

  Future<void> updateProfileData(ProfileResponseModel profileData) async {
    emit(const ProfileState.loadingUpdateProfile());
    final response = await _profileRepo.updateProfile(profileData);
    response.when(
      success: (profileData) {
        emit(ProfileState.successUpdateProfile(profileData));
      },
      failure: (error) {
        emit(ProfileState.errorUpdateProfile(error: error.message.toString()));
      },
    );
  }
}
