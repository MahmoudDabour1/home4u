

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/networking/api_constants.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';
part 'login_remote_data_source.g.dart';
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class LoginRemoteDataSource {
 factory LoginRemoteDataSource(Dio dio, {String baseUrl}) = _LoginRemoteDataSource;

 @POST(ApiConstants.loginEndPoint)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
}