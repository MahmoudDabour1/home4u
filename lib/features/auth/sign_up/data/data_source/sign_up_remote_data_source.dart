import 'package:dio/dio.dart';
import 'package:home4u/features/auth/sign_up/data/models/city_model.dart';
import 'package:home4u/features/auth/sign_up/data/models/governorate_model.dart';
import 'package:home4u/features/auth/sign_up/data/models/sign_up_response.dart';
import 'package:home4u/features/auth/sign_up/data/models/user_type_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/networking/api_constants.dart';
import '../models/business_type.dart';
import '../models/sign_up_body.dart';

part 'sign_up_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class SignUpRemoteDataSource {
  factory SignUpRemoteDataSource(Dio dio, {String baseUrl}) =
      _SignUpRemoteDataSource;

  @GET(ApiConstants.userTypesEp)
  Future<UserTypeModel> getUserTypes();

  @POST(ApiConstants.signUpEp)
  Future<SignUpResponse> signUp(
    @Body() SignUpBody signUpBody,
  );

  @GET(ApiConstants.governoratesEp)
  Future<GovernorateModel> getGovernorates();

  @GET("/api/v1/cities/governorate/{governorateId}")
  Future<CityModel> getCities(
    @Path("governorateId") int governorateId,
  );

  Future<BusinessTypesModel> getBusinessTypes(
    @Path("userTypeId") int userTypeId,
  );
}
