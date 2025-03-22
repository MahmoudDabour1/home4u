import 'dart:developer';
import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/auth/login/data/data_sources/login_remote_data_source.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/routing/router_observer.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';

abstract class LoginRepo {
  Future<ApiResult<LoginResponse>> login(LoginRequestBody loginRequestBody,);
}

class LoginRepoImpl implements LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepoImpl({required this.loginRemoteDataSource});

  @override
  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody,) async {
    try {
      final response = await loginRemoteDataSource.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      logger.e("Login error: ${error.toString()}");
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}