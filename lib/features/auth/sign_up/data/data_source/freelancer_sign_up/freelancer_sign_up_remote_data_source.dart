import 'package:dio/dio.dart';
import 'package:home4u/features/auth/sign_up/data/models/services/freelancer_services.dart';
import 'package:home4u/features/auth/sign_up/data/models/services/freelancer_types.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../../core/networking/api_constants.dart';

part 'freelancer_sign_up_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class FreelancerSignUpRemoteDataSource {

  factory FreelancerSignUpRemoteDataSource(Dio dio, {String baseUrl}) =
      _FreelancerSignUpRemoteDataSource;


  @GET(ApiConstants.engineerTypesEp)
  Future<FreelancerTypes> getEngineerTypes();

  @GET("/api/v1/engineer-services/service/{engineerTypeId}")
  Future<FreelancerServices> getEngineerServices(
    @Path("engineerTypeId") int engineerTypeId,
  );

  @GET(ApiConstants.technicalWorkerTypesEp)
  Future<FreelancerTypes> getTechnicalWorkerTypes();

  @GET("/api/v1/technical-worker-services/service/{technicalWorkerTypeId}")
  Future<FreelancerServices> getTechnicalWorkerServices(
    @Path("technicalWorkerTypeId") int technicalWorkerTypeId,
  );

  @GET(ApiConstants.engineeringOfficeFieldsEp)
  Future<FreelancerTypes> getEngineeringOfficeFields();

  @GET("/api/v1/engineering-office-department/field/{engineeringOfficeFieldId}")
  Future<FreelancerServices> getEngineeringOfficeServices(
    @Path("engineeringOfficeFieldId") int engineeringOfficeFieldId,
  );
}
