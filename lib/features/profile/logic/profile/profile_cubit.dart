import 'package:bloc/bloc.dart';
import 'package:home4u/features/profile/logic/profile/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState.initial());
}
