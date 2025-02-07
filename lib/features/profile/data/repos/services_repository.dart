import 'package:home4u/features/profile/data/models/services/update_service_body.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../auth/sign_up/data/models/services/freelancer_services.dart';
import '../data_sources/services_remote_data_source.dart';
import '../models/projects/delete_project_response_model.dart';

abstract class ServicesRepository {
  Future<ApiResult<FreelancerServices>> getServices(int engineerId);

  Future<ApiResult<bool>> updateServices(
      List<UpdateServiceBody> servicesData, int userId);

  Future<ApiResult<bool>> deleteService(int engineerId, int serviceId);
}

class ServicesRepositoryImpl implements ServicesRepository {
  final ServicesRemoteDataSource servicesRemoteDataSource;

  ServicesRepositoryImpl(this.servicesRemoteDataSource);

  @override
  Future<ApiResult<bool>> deleteService(int engineerId, int serviceId) async {
    try {
      final response =
          await servicesRemoteDataSource.deleteService(engineerId, serviceId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<FreelancerServices>> getServices(int engineerId) async {
    try {
      final response = await servicesRemoteDataSource.getServices(engineerId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<bool>> updateServices(
    List<UpdateServiceBody> servicesData,
    int userId,
  ) async {
    try {
      final response =
          await servicesRemoteDataSource.updateServices(servicesData, userId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
