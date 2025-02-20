import 'package:home4u/core/networking/api_result.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../data_source/verification_remote_data_source.dart';
import '../models/verification_response_model.dart';

class VerificationRepo {
  final VerificationRemoteDataSource _verificationDataSource;

  VerificationRepo(this._verificationDataSource);

  Future<ApiResult<VerificationResponseModel>> verifyEmail(
      String email, String otp) async {
    try {
      final response = await _verificationDataSource.verifyEmail(email, otp);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
