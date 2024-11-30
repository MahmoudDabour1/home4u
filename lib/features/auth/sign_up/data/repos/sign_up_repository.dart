import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/auth/sign_up/data/models/sign_up_body.dart';
import 'package:home4u/features/auth/sign_up/data/models/sign_up_response.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../data_source/sign_up_remote_data_source.dart';
import '../models/user_type_model.dart';

abstract class SignUpRepository {
  Future<ApiResult<List<UserTypeData>>> getUserTypes();

  Future<ApiResult<SignUpResponse>> signUp(SignUpBody signUpBody);
}

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpRemoteDataSource remoteDataSource;

  SignUpRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResult<List<UserTypeData>>> getUserTypes() async {
    try {
      final userTypeData = await remoteDataSource.getUserTypes();
      return ApiResult.success(userTypeData.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<SignUpResponse>> signUp(SignUpBody signUpBody) async {
    try {
      final response = await remoteDataSource.signUp(signUpBody);
      return ApiResult.success(response);
    } catch (error) {
      return Future.value(ApiResult.failure(ApiErrorHandler.handle(error)));
    }
  }
}
