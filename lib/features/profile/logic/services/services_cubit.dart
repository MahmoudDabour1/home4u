import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:home4u/features/profile/data/repos/services_repository.dart';
import 'package:home4u/features/profile/logic/services/services_state.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/shared_pref_keys.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/dio_factory.dart';
import '../../../../core/routing/router_observer.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../auth/sign_up/data/models/services/freelancer_services.dart';
import '../../data/models/profile/engineer_profile_response_model.dart';
import '../../data/models/profile/engineering_office_profile_response_model.dart';
import '../../data/models/profile/technical_worker_profile_response_model.dart';
import '../../data/models/services/Service_update_delete_response_model.dart';
import '../../data/models/services/update_service_body.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final ServicesRepository _servicesRepository;

  ServicesCubit(this._servicesRepository)
      : super(const ServicesState.initial());

  List<int>? selectedServices = [];
  List<FreelancerServiceData>? services = [];

  Future<void> getServices({required int id}) async {
    emit(const ServicesState.getServicesLoading());

    try {
      final userType = await _getUserType();
      final result = await _fetchServicesByUserType(userType, id);

      result.when(
        success: (servicesData) {
          services = servicesData.data;
          selectedServices = servicesData.data.map((e) => e.id).toList();
          emit(ServicesState.getServicesSuccess(servicesData));
        },
        failure: (error) {
          logger.e(error.message.toString());
          emit(ServicesState.getServicesError(error: error.message.toString()));
        },
      );
    } catch (e) {
      emit(ServicesState.getServicesError(error: e.toString()));
    }
  }

  Future<void> updateServices({
    required List<UpdateServiceBody> serviceIds,
    required int userId,
    required int id,
  }) async {
    emit(const ServicesState.updateServicesLoading());
    DioFactory.setContentType('application/json');

    try {
      final userType = await _getUserType();
      final result =
          await _updateServicesByUserType(userType, serviceIds, userId);

      result.when(
        success: (response) async {
          logger.t('Services Updated Successfully');
          emit(ServicesState.updateServicesSuccess(response));
          await getServices(id: id);
          await _updateCache();
        },
        failure: (error) {
          logger.e(error.message.toString());
          emit(ServicesState.updateServicesError(
              error: error.message.toString()));
        },
      );
    } catch (e) {
      emit(ServicesState.updateServicesError(error: e.toString()));
    }
  }

  Future<void> _updateCache() async {
    final userType = await _getUserType();
    switch (userType) {
      case "ENGINEER":
        await _updateEngineerCache();
        break;
      case "TECHNICAL_WORKER":
        await _updateTechnicalWorkerCache();
        break;
      case "ENGINEERING_OFFICE":
        await _updateEngineeringOfficeCache();
        break;
      default:
        throw Exception("Invalid user type");
    }
    await _updateEngineerCache();

    await _updateEngineeringOfficeCache();

    await _updateTechnicalWorkerCache();
  }

  Future<void> _updateTechnicalWorkerCache() async {
    var technicalWorkerBox = await Hive.openBox<TechnicalWorkerResponseModel>(
        kTechnicalWorkerProfileBox);
    var technicalWorkerProfileData =
        technicalWorkerBox.get(kTechnicalWorkerProfileData);
    if (technicalWorkerProfileData != null) {
      technicalWorkerProfileData.data?.workerServs =
          services?.map((e) => FreeLancerType(id: e.id, name: e.name)).toList();
      await technicalWorkerBox.put(
          kTechnicalWorkerProfileData, technicalWorkerProfileData);
    }
  }

  Future<void> _updateEngineeringOfficeCache() async {
    var engineeringOfficeBox =
        await Hive.openBox<EngineeringOfficeProfileResponseModel>(
            kEngineeringOfficeProfileBox);
    var engineeringOfficeProfileData =
        engineeringOfficeBox.get(kEngineeringOfficeProfileData);
    if (engineeringOfficeProfileData != null) {
      engineeringOfficeProfileData.data?.engineeringOfficeDepartments = services
          ?.map((e) => EngineeringOffice(id: e.id, name: e.name))
          .toList();

      await engineeringOfficeBox.put(
          kEngineeringOfficeProfileData, engineeringOfficeProfileData);
    }
  }

  Future<void> _updateEngineerCache() async {
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
  }

  Future<void> deleteService({
    required int id,
    required int serviceId,
    required int userId,
  }) async {
    emit(const ServicesState.deleteServiceLoading());

    try {
      final userType = await _getUserType();
      final result = await _deleteServiceByUserType(userType, id, serviceId);

      result.when(
        success: (response) async {
          emit(ServicesState.deleteServiceSuccess(response));
          // await getServices(id: id);
          selectedServices?.remove(
              services?.firstWhere((element) => element.id == serviceId).id);
          await _updateCache();
        },
        failure: (error) {
          logger.e(error.message.toString());
          emit(ServicesState.deleteServiceError(
              error: error.message.toString()));
        },
      );
    } catch (e) {
      emit(ServicesState.deleteServiceError(error: e.toString()));
    }
  }

  Future<String> _getUserType() async {
    return await SharedPrefHelper.getString(SharedPrefKeys.userType);
  }

  Future<ApiResult<FreelancerServices>> _fetchServicesByUserType(
      String userType, int id) async {
    switch (userType) {
      case "ENGINEER":
        return await _servicesRepository.getEngineerServices(id);
      case "TECHNICAL_WORKER":
        return await _servicesRepository.getTechnicalWorkerServices(id);
      case "ENGINEERING_OFFICE":
        return await _servicesRepository.getEngineeringOfficeServices(id);
      default:
        throw Exception("Invalid user type");
    }
  }

  Future<ApiResult<ServiceUpdateDeleteResponseModel>> _updateServicesByUserType(
      String userType, List<UpdateServiceBody> serviceIds, int userId) async {
    switch (userType) {
      case "ENGINEER":
        return await _servicesRepository.updateEngineerServices(
            serviceIds, userId);
      case "TECHNICAL_WORKER":
        return await _servicesRepository.updateTechnicalWorkerServices(
            serviceIds, userId);
      case "ENGINEERING_OFFICE":
        return await _servicesRepository.updateEngineeringOfficeServices(
            serviceIds, userId);
      default:
        throw Exception("Invalid user type");
    }
  }

  Future<ApiResult<ServiceUpdateDeleteResponseModel>> _deleteServiceByUserType(
      String userType, int id, int serviceId) async {
    switch (userType) {
      case "ENGINEER":
        return await _servicesRepository.deleteEngineerService(id, serviceId);
      case "TECHNICAL_WORKER":
        return await _servicesRepository.deleteTechnicalWorkerService(
            id, serviceId);
      case "ENGINEERING_OFFICE":
        return await _servicesRepository.deleteEngineeringOfficeService(
            id, serviceId);
      default:
        throw Exception("Invalid user type");
    }
  }
}
