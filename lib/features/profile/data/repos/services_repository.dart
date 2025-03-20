import 'package:home4u/features/profile/data/models/services/update_service_body.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../auth/sign_up/data/models/services/freelancer_services.dart';
import '../data_sources/services_remote_data_source.dart';
import '../models/services/Service_update_delete_response_model.dart';

abstract class ServicesRepository {
  Future<ApiResult<FreelancerServices>> getEngineerServices(int engineerId);

  Future<ApiResult<FreelancerServices>> getTechnicalWorkerServices(
    int workerId,
  );

  Future<ApiResult<ServiceUpdateDeleteResponseModel>> updateEngineerServices(
    List<UpdateServiceBody> servicesData,
    int userId,
  );

  Future<ApiResult<ServiceUpdateDeleteResponseModel>>
      updateTechnicalWorkerServices(
    List<UpdateServiceBody> servicesData,
    int userId,
  );

  Future<ApiResult<ServiceUpdateDeleteResponseModel>> deleteEngineerService(int engineerId, int serviceId);

  Future<ApiResult<ServiceUpdateDeleteResponseModel>> deleteTechnicalWorkerService(
    int workerId,
    int serviceId,
  );
}

class ServicesRepositoryImpl implements ServicesRepository {
  final ServicesRemoteDataSource servicesRemoteDataSource;

  ServicesRepositoryImpl(this.servicesRemoteDataSource);

  @override
  Future<ApiResult<ServiceUpdateDeleteResponseModel>> deleteEngineerService(
      int engineerId, int serviceId) async {
    try {
      final response = await servicesRemoteDataSource.deleteEngineerService(
          engineerId, serviceId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<FreelancerServices>> getEngineerServices(
      int engineerId) async {
    try {
      final response =
          await servicesRemoteDataSource.getEngineerServices(engineerId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ServiceUpdateDeleteResponseModel>> updateEngineerServices(
    List<UpdateServiceBody> servicesData,
    int userId,
  ) async {
    try {
      final response = await servicesRemoteDataSource.updateEngineerServices(
          servicesData, userId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ServiceUpdateDeleteResponseModel>> deleteTechnicalWorkerService(
    int workerId,
    int serviceId,
  ) async {
    try {
      final response = await servicesRemoteDataSource
          .deleteTechnicalWorkerService(workerId, serviceId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<FreelancerServices>> getTechnicalWorkerServices(
    int workerId,
  ) async {
    try {
      final response =
          await servicesRemoteDataSource.getTechnicalWorkerServices(workerId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<ServiceUpdateDeleteResponseModel>>
      updateTechnicalWorkerServices(
    List<UpdateServiceBody> servicesData,
    int userId,
  ) async {
    try {
      final response = await servicesRemoteDataSource
          .updateTechnicalWorkerServices(servicesData, userId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
