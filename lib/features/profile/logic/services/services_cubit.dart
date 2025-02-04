import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/profile/data/repos/services_repository.dart';
import 'package:home4u/features/profile/logic/services/services_state.dart';

import '../../../../core/routing/router_observer.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final ServicesRepository _servicesRepository;

  ServicesCubit(this._servicesRepository)
      : super(const ServicesState.initial());

  void getServices({required int engineerId}) async {
    emit(const ServicesState.getServicesLoading());
    final result = await _servicesRepository.getServices(
      engineerId,
    );
    result.when(
      success: (servicesData) {
        logger.i(servicesData);
        emit(ServicesState.getServicesSuccess(servicesData));
      },
      failure: (error) {
        emit(ServicesState.getServicesError(error: error.errorsDetails.toString()));
      },
    );
  }

  void updateServices({required FormData servicesData, required int userId}) async {
    emit(const ServicesState.updateServicesLoading());
    final result = await _servicesRepository.updateServices(
      servicesData,
      userId,
    );
    result.when(
      success: (_) {
        emit(const ServicesState.updateServicesSuccess());
      },
      failure: (error) {
        emit(ServicesState.updateServicesError(error: error.errorsDetails.toString()));
      },
    );
  }

  Future<void> deleteService({required int engineerId, required int serviceId}) async {
    emit(const ServicesState.deleteServiceLoading());
    final result = await _servicesRepository.deleteService(
      engineerId,
      serviceId,
    );
    result.when(
      success: (_) {
        emit(const ServicesState.deleteServiceSuccess());
      },
      failure: (error) {
        emit(ServicesState.deleteServiceError(error: error.errorsDetails.toString()));
      },
    );
  }
}
