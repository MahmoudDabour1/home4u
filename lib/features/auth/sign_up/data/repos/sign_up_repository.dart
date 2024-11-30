import 'package:home4u/core/networking/api_error_model.dart';
import 'package:home4u/core/networking/api_result.dart';

import '../data_source/sign_up_remote_data_source.dart';
import '../models/user_type_model.dart';

abstract class SignUpRepository {
  Future<ApiResult<List<UserTypeData>>> getUserTypes();
}

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpRemoteDataSource remoteDataSource;

  SignUpRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResult<List<UserTypeData>>> getUserTypes() async {
    final userTypeData = await remoteDataSource.getUserTypes();
    return ApiResult.success(userTypeData.data);
  }
}
