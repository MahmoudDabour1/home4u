import 'package:dio/dio.dart';
import 'package:home4u/features/auth/sign_up/data/models/services/freelancer_services.dart';
import 'package:home4u/features/profile/data/models/services/Service_update_delete_response_model.dart';
import 'package:home4u/features/profile/data/models/services/update_service_body.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';

part 'services_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ServicesRemoteDataSource {
  factory ServicesRemoteDataSource(Dio dio, {String baseUrl}) =
      _ServicesRemoteDataSource;

  @GET(ApiConstants.engineerServicesEp)
  Future<FreelancerServices> getEngineerServices(
    @Query("engineerId") int engineerId,
  );

  @PUT(ApiConstants.updateEngineerServices)
  Future<ServiceUpdateDeleteResponseModel> updateEngineerServices(
    @Body() List<UpdateServiceBody> servicesData,
    @Query("userId") int userId,
  );

  @DELETE(ApiConstants.engineerServicesEp)
  Future<ServiceUpdateDeleteResponseModel> deleteEngineerService(
    @Query("engineerId") int engineerId,
    @Query("serviceId") int serviceId,
  );

  @GET(ApiConstants.technicalWorkerServicesEp)
  Future<FreelancerServices> getTechnicalWorkerServices(
    @Query("workerId") int workerId,
  );

  @PUT(ApiConstants.updateTechnicalWorkerServices)
  Future<ServiceUpdateDeleteResponseModel>  updateTechnicalWorkerServices(
    @Body() List<UpdateServiceBody> servicesData,
    @Query("userId") int userId,
  );

  @DELETE(ApiConstants.technicalWorkerServicesEp)
  Future<ServiceUpdateDeleteResponseModel> deleteTechnicalWorkerService(
    @Query("workerId") int workerId,
    @Query("serviceId") int serviceId,
  );
}
