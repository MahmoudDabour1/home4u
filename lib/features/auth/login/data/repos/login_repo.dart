import 'package:home4u/core/networking/api_error_model.dart';
import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/auth/login/data/data_sources/login_remote_data_source.dart';

import '../models/login_request_body.dart';
import '../models/login_response.dart';

class LoginRepo {
  final LoginRemoteDataSource _loginRemoteDataSource;

  LoginRepo(this._loginRemoteDataSource);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _loginRemoteDataSource.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorModel(message: "Something went wrong"));
      // return ApiResult.failure(ApiErrorHandler.handle(error));
      // return ApiResult.failure();
    }
  }
}
