import 'package:bloc/bloc.dart';
import 'package:home4u/features/profile/data/repos/services_repository.dart';
import 'package:home4u/features/profile/logic/services/services_state.dart';

import '../../../../core/networking/dio_factory.dart';
import '../../../../core/routing/router_observer.dart';
import '../../data/models/services/update_service_body.dart';

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
        logger.e(error.errorsDetails.toString());
        emit(ServicesState.getServicesError(
            error: error.errorsDetails.toString()));
      },
    );
  }

  Future<void> updateServices({
    required List<UpdateServiceBody> servicesData,
    required int userId,
    required int engineerId,
  }) async {
    emit(const ServicesState.updateServicesLoading());
    DioFactory.setContentType('application/json');

    final result = await _servicesRepository.updateServices(
      servicesData,
      userId,
    );
    result.when(
      success: (_) {
        logger.t('Services Updated Successfully');
        emit(ServicesState.updateServicesSuccess());
        getServices(engineerId: engineerId);
      },
      failure: (error) {
        logger.e(error.errorsDetails.toString());
        emit(
          ServicesState.updateServicesError(error: "Update doesn't work"),
        );
      },
    );
  }

  Future<void> deleteService(
      {required int engineerId, required int serviceId}) async {
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
        emit(ServicesState.deleteServiceError(
            error: error.errorsDetails.toString()));
      },
    );
  }
}
