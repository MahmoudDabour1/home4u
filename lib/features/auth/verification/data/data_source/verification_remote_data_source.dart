import 'package:dio/dio.dart';
import 'package:home4u/features/auth/verification/data/models/verification_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/networking/api_constants.dart';

part 'verification_remote_data_source.g.dart';
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class VerificationRemoteDataSource {
  factory VerificationRemoteDataSource(Dio dio, {String baseUrl}) =
      _VerificationRemoteDataSource;

  @POST(ApiConstants.verificationEP)
  Future<VerificationResponseModel> verifyEmail(
    @Query("email") String email,
    @Query("otp") String otp,
  );
}
