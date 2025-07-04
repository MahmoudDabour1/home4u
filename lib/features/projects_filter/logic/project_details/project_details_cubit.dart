import 'package:bloc/bloc.dart';
import 'package:home4u/features/projects_filter/data/repository/services_project_details_repository.dart';
import 'package:home4u/features/projects_filter/logic/project_details/project_details_state.dart';

class ProjectDetailsCubit extends Cubit<ProjectDetailsState> {
  final ServicesProjectDetailsRepository _projectDetailsRepository;

  ProjectDetailsCubit(this._projectDetailsRepository)
      : super(const ProjectDetailsState.initial());

  ///Ask Technical Service Details
  Future<void> getAskTechnicalServiceDetails(String askId) async {
    emit(const ProjectDetailsState.askTechnicalDetailsLoading());
    final result =
        await _projectDetailsRepository.getAskTechnicalServiceDetails(askId);
    result.when(
      success: (data) =>
          emit(ProjectDetailsState.askTechnicalDetailsSuccess(data)),
      failure: (error) => emit(ProjectDetailsState.askTechnicalDetailsFailure(
          error: error.message.toString())),
    );
  }

  ///Ask Engineer Service Details
  Future<void> getAskEngineerServiceDetails(String askId) async {
    emit(const ProjectDetailsState.askEngineerDetailsLoading());
    final result =
        await _projectDetailsRepository.getAskEngineerServiceDetails(askId);
    result.when(
      success: (data) =>
          emit(ProjectDetailsState.askEngineerDetailsSuccess(data)),
      failure: (error) => emit(ProjectDetailsState.askEngineerDetailsFailure(
          error: error.message.toString())),
    );
  }

  ///Renovate House Details
  Future<void> getRenovateHouseDetails(String renovateId) async {
    emit(const ProjectDetailsState.renovateHouseDetailsLoading());
    final result =
        await _projectDetailsRepository.getRenovateHouseDetails(renovateId);
    result.when(
      success: (data) =>
          emit(ProjectDetailsState.renovateHouseDetailsSuccess(data)),
      failure: (error) => emit(ProjectDetailsState.renovateHouseDetailsFailure(
          error: error.message.toString())),
    );
  }

  ///Renovate House Fixed Package Details
  Future<void> getRenovateHouseFixedPackageDetails(String packageId) async {
    emit(const ProjectDetailsState.renovateHouseFixedPackageDetailsLoading());
    final result = await _projectDetailsRepository
        .getRenovateHouseFixedPackageDetails(packageId);
    result.when(
      success: (data) => emit(
          ProjectDetailsState.renovateHouseFixedPackageDetailsSuccess(data)),
      failure: (error) => emit(
          ProjectDetailsState.renovateHouseFixedPackageDetailsFailure(
              error: error.message.toString())),
    );
  }

  ///Request Design Details
  Future<void> getRequestDesignDetails(String requestId) async {
    emit(const ProjectDetailsState.requestDesignDetailsLoading());
    final result =
        await _projectDetailsRepository.getRequestDesignDetails(requestId);
    result.when(
      success: (data) =>
          emit(ProjectDetailsState.requestDesignDetailsSuccess(data)),
      failure: (error) => emit(ProjectDetailsState.requestDesignDetailsFailure(
          error: error.message.toString())),
    );
  }
}
