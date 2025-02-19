import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:home4u/features/profile/data/repos/services_repository.dart';
import 'package:home4u/features/profile/logic/services/services_state.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/shared_pref_keys.dart';
import '../../../../core/networking/dio_factory.dart';
import '../../../../core/routing/router_observer.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../auth/sign_up/data/models/services/freelancer_services.dart';
import '../../data/models/profile/engineer_profile_response_model.dart';
import '../../data/models/profile/technical_worker_profile_response_model.dart';
import '../../data/models/services/update_service_body.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final ServicesRepository _servicesRepository;

  ServicesCubit(this._servicesRepository)
      : super(const ServicesState.initial());

  bool isEngineer = true;
  List<int>? selectedServices = [];
  List<FreelancerServiceData>? services = [];

  Future<void> getServices({required int id}) async {
    emit(const ServicesState.getServicesLoading());

    final String userType =
        await SharedPrefHelper.getString(SharedPrefKeys.userType);
    final result = (isEngineer = userType == "ENGINEER")
        ? await _servicesRepository.getEngineerServices(id)
        : await _servicesRepository.getTechnicalWorkerServices(id);

    result.when(
      success: (servicesData) {
        services = servicesData.data;
        selectedServices = servicesData.data.map((e) => e.id).toList();
        // logger.i(servicesData);
        emit(ServicesState.getServicesSuccess(servicesData));
      },
      failure: (error) {
        logger.e(error.message.toString());
        emit(ServicesState.getServicesError(
            error: error.message.toString()));
      },
    );
  }

  Future<void> updateServices({
    required List<UpdateServiceBody> serviceIds,
    required int userId,
    required int id,
  }) async {
    emit(const ServicesState.updateServicesLoading());
    DioFactory.setContentType('application/json');

    final result = isEngineer
        ? await _servicesRepository.updateEngineerServices(serviceIds, userId)
        : await _servicesRepository.updateTechnicalWorkerServices(
            serviceIds, userId);

    result.when(
      success: (response) async {
        logger.t('Services Updated Successfully');
        emit(ServicesState.updateServicesSuccess(response));
        await getServices(id: id);
        await _updateCache(userId);
      },
      failure: (error) {
        logger.e(error.message.toString());
        emit(
          ServicesState.updateServicesError(
              error: error.message.toString()),
        );
      },
    );
  }

  Future<void> _updateCache(int userId) async {
    if (isEngineer) {
      var engineerBox =
          await Hive.openBox<EngineerProfileResponseModel>(kEngineerProfileBox);
      var engineerProfileData = engineerBox.get(kEngineerProfileData);
      if (engineerProfileData != null) {
        engineerProfileData.data?.engineerServ = services
            ?.map((e) => FreeLancerType(
                  id: e.id,
                  name: e.name,
                  code: e.code,
                ))
            .toList();
        logger.i(engineerProfileData.data?.engineerServ);
        logger.w("Engineer Services Updated $services");
        await engineerBox.put(kEngineerProfileData, engineerProfileData);
      }
    } else {
      var technicalWorkerBox = await Hive.openBox<TechnicalWorkerResponseModel>(
          kTechnicalWorkerProfileBox);
      var technicalWorkerProfileData =
          technicalWorkerBox.get(kTechnicalWorkerProfileData);
      if (technicalWorkerProfileData != null) {
        technicalWorkerProfileData.data?.workerServs = services
            ?.map((e) => FreeLancerType(id: e.id, name: e.name))
            .toList();
        await technicalWorkerBox.put(
            kTechnicalWorkerProfileData, technicalWorkerProfileData);
      }
    }
  }

  Future<void> deleteService(
      {required int id, required int serviceId, required int userId}) async {
    emit(const ServicesState.deleteServiceLoading());
    final result = isEngineer
        ? await _servicesRepository.deleteEngineerService(id, serviceId)
        : await _servicesRepository.deleteTechnicalWorkerService(id, serviceId);
    result.when(
      success: (_) async {
        // logger.t('Service Deleted Successfully');
        emit(const ServicesState.deleteServiceSuccess());
        await getServices(id: id);
        await _updateCache(userId);
      },
      failure: (error) {
        emit(ServicesState.deleteServiceError(
            error: error.message.toString()));
      },
    );
  }
}