import 'package:bloc/bloc.dart';
import 'package:home4u/features/profile/logic/profile/profile_state.dart';

import '../../data/repos/projects_repo.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProjectsRepo _getProjectsRepo;

  ProfileCubit(this._getProjectsRepo) : super(const ProfileState.initial());
}
