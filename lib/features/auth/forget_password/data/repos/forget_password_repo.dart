import 'package:home4u/core/networking/api_error_handler.dart';
import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/auth/forget_password/data/models/forget_password_model.dart';

import '../data_source/forget_password_data_source.dart';

class ForgetPasswordRepo {
  final ForgetPasswordDataSource _forgetPasswordDataSource;

  ForgetPasswordRepo(this._forgetPasswordDataSource);

  Future<ApiResult<ForgetPasswordResponseModel>> forgetPassword(String email) async {
    try {
      final response = await _forgetPasswordDataSource.forgetPassword(email);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}