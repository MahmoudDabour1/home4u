import 'package:home4u/features/auth/new_password/data/data_source/new_password_remote_data_source.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../models/new_password_response_model.dart';

class NewPasswordRepo{
  final NewPasswordRemoteDataSource _newPasswordRemoteDataSource;

  NewPasswordRepo(this._newPasswordRemoteDataSource);
  Future<ApiResult<NewPasswordResponseModel>> newPassword(String email, String password) async {
    try {
      final response = await _newPasswordRemoteDataSource.newPassword(email, password);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}