import 'package:dio/dio.dart';
import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/auth/sign_up/data/data_source/common_local_data_source.dart';
import 'package:home4u/features/auth/sign_up/data/models/business_type.dart';
import 'package:home4u/features/auth/sign_up/data/models/governorate_model.dart';
import 'package:home4u/features/auth/sign_up/data/models/sign_up_body.dart';
import 'package:home4u/features/auth/sign_up/data/models/sign_up_response.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../exhibition/data/models/upload_image_response.dart';
import '../data_source/sign_up_remote_data_source.dart';
import '../models/city_model.dart';
import '../models/user_type_model.dart';

abstract class SignUpRepository {
  Future<ApiResult<List<UserTypeData>>> getUserTypes();

  Future<ApiResult<List<GovernorateDataModel>>> getGovernorates();

  Future<ApiResult<List<CityDataModel>>> getCities(int governorateId);

  Future<ApiResult<List<BaseData>>> getBusinessTypes(int userTypeId);

  Future<ApiResult<SignUpResponse>> signUp(SignUpBody signUpBody);

  Future<ApiResult<UploadImageResponse>> uploadEngineeringOfficeImages(
    String pathId,
    int id,
    FormData image,
  );
}

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpRemoteDataSource remoteDataSource;
  final CommonLocalDataSource localDataSource;

  SignUpRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

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
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<GovernorateDataModel>>> getGovernorates() async {
    try {
      // List<GovernorateDataModel> governorates;
      // governorates = localDataSource.getLocalGovernorates();
      // if (governorates.isNotEmpty) {
      //   return ApiResult.success(governorates);
      // }
      final response = await remoteDataSource.getGovernorates();
      // governorates = response.data;
      return ApiResult.success(response.data);
    } catch (error) {
      return Future.value(ApiResult.failure(ApiErrorHandler.handle(error)));
    }
  }

  @override
  Future<ApiResult<List<CityDataModel>>> getCities(int governorateId) async {
    try {
      final cities = await remoteDataSource.getCities(governorateId);
      return ApiResult.success(cities.data);
    } catch (error) {
      return Future.value(ApiResult.failure(ApiErrorHandler.handle(error)));
    }
  }

  @override
  Future<ApiResult<List<BaseData>>> getBusinessTypes(int userTypeId) async {
    try {
      final businessTypes = await remoteDataSource.getBusinessTypes(userTypeId);
      return ApiResult.success(businessTypes.data);
    } catch (error) {
      return Future.value(ApiResult.failure(ApiErrorHandler.handle(error)));
    }
  }

  @override
  Future<ApiResult<UploadImageResponse>> uploadEngineeringOfficeImages(
      String pathId, int id, FormData image) async {
    try {
      final response = await remoteDataSource.uploadEngineeringOfficeImages(
        pathId,
        id,
        image,
      );
      return ApiResult.success(response);
    } catch (error) {
      return Future.value(ApiResult.failure(ApiErrorHandler.handle(error)));
    }
  }
}
