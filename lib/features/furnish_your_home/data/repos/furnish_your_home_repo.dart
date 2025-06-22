import 'package:home4u/features/furnish_your_home/data/models/furnish_your_home_request_model.dart';
import 'package:home4u/features/furnish_your_home/data/models/furnish_your_home_response_model.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../data_source/furnish_your_home_remote_data_source.dart';

abstract class FurnishYourHomeRepo {
  Future<ApiResult<FurnishYourHomeResponseModel>> sendFurnishYourHome(
      FurnishYourHomeRequestModel furnishYourHomeRequestModel);
}

class FurnishYourHomeRepoImpl implements FurnishYourHomeRepo {
  final FurnishYourHomeRemoteDataSource furnishYourHomeRemoteDataSource;

  FurnishYourHomeRepoImpl(this.furnishYourHomeRemoteDataSource);

  @override
  Future<ApiResult<FurnishYourHomeResponseModel>> sendFurnishYourHome(
      FurnishYourHomeRequestModel furnishYourHomeRequestModel) async {
    try {
      final response = await furnishYourHomeRemoteDataSource
          .addFurnishYourHome(furnishYourHomeRequestModel);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
