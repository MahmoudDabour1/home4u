import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/profile/data/repos/profile_repo.dart';
import 'package:home4u/features/profile/logic/profile/profile_state.dart';

import '../../../../core/routing/router_observer.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(const ProfileState.initial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  //get engineer data
  Future<void> getProfileData() async {
    emit(const ProfileState.loadingProfileData());
    final response = await _profileRepo.getEngineerByToken();
    response.when(
      success: (getEngineerData) {
        emit(ProfileState.successProfileData(getEngineerData));
      },
      failure: (error) {
        logger.d("Error: ${error.message}");
        emit(ProfileState.errorProfileData(error: error.message.toString()));
      },
    );
  }

}
