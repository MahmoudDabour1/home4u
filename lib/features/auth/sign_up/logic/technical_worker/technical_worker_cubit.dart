import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/auth/sign_up/data/models/services/freelancer_services.dart';
import 'package:home4u/features/auth/sign_up/data/models/services/freelancer_types.dart';

import '../../data/repos/freelancer_sign_up_repository.dart';

part 'technical_worker_state.dart';

part 'technical_worker_cubit.freezed.dart';

class TechnicalWorkerCubit extends Cubit<TechnicalWorkerState> {
  final FreelancerSignUpRepository _technicalWorkerSignUpRepository;

  TechnicalWorkerCubit(this._technicalWorkerSignUpRepository)
      : super(const TechnicalWorkerState.initial());

  List<FreelancerTypeData> technicalWorkerTypes = [];
  List<FreelancerServiceData> technicalWorkerServices = [];

  void getTechnicalWorkerTypes() async {
    emit(const TechnicalWorkerState.loadingTechnicalWorkerTypes());
    try {
      final result =
          await _technicalWorkerSignUpRepository.getTechnicalWorkerTypes();
      result.when(success: (data) {
        technicalWorkerTypes = data;
        emit(TechnicalWorkerState.successTechnicalWorkerTypes(data));
      }, failure: (error) {
        emit(TechnicalWorkerState.errorTechnicalWorkerTypes(
            error: error.message ?? "An unknown error occurred"));
      });
    } catch (error) {
      emit(TechnicalWorkerState.errorTechnicalWorkerTypes(
          error: "Unexpected error occurred: ${error.toString()}"));
    }
  }

  void getTechnicalWorkerServices(int technicalWorkerTypeId) async {
    emit(const TechnicalWorkerState.loadingTechnicalWorkerServices());
    try {
      final result = await _technicalWorkerSignUpRepository
          .getTechnicalWorkerServices(technicalWorkerTypeId);
      result.when(success: (data) {
        technicalWorkerServices = data;
        emit(TechnicalWorkerState.successTechnicalWorkerServices(data));
      }, failure: (error) {
        emit(TechnicalWorkerState.errorTechnicalWorkerServices(
            error: error.message ?? "An unknown error occurred"));
      });
    } catch (error) {
      emit(TechnicalWorkerState.errorTechnicalWorkerServices(
          error: "Unexpected error occurred: ${error.toString()}"));
    }
  }
}
