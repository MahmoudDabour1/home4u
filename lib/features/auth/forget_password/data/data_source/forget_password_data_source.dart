
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/networking/api_constants.dart';
import '../models/forget_password_model.dart';
part 'forget_password_data_source.g.dart';
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ForgetPasswordDataSource {
  factory ForgetPasswordDataSource(Dio dio, {String baseUrl}) = _ForgetPasswordDataSource;
  @POST(ApiConstants.forgetPasswordEp)
  Future<ForgetPasswordResponseModel> forgetPassword(
    @Query("email") String email,
  );
}