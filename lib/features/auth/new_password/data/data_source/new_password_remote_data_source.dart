import 'package:dio/dio.dart';
import 'package:home4u/features/auth/new_password/data/models/new_password_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/networking/api_constants.dart';

part 'new_password_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class NewPasswordRemoteDataSource {
  factory NewPasswordRemoteDataSource(Dio dio, {String baseUrl}) =
      _NewPasswordRemoteDataSource;

  @PUT(ApiConstants.newPasswordEP)
  Future<NewPasswordResponseModel> newPassword(
    @Query("email") String email,
    @Query("newPassword") String password,
  );
}
