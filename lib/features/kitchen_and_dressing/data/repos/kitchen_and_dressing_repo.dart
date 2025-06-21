import 'package:home4u/core/networking/api_error_handler.dart';
import 'package:home4u/features/kitchen_and_dressing/data/models/dressing_request_model.dart';
import 'package:home4u/features/kitchen_and_dressing/data/models/dressing_response_model.dart';

import '../../../../core/networking/api_result.dart';
import '../data_source/kitchen_and_dressing_remote_data_source.dart';

abstract class KitchenAndDressingRepo {
  Future<ApiResult<DressingResponseModel>> sendDressing(
      DressingRequestModel dressingRequestModel);
}

class KitchenAndDressingRepoImpl implements KitchenAndDressingRepo {
  final KitchenAndDressingRemoteDataSource remoteDataSource;

  KitchenAndDressingRepoImpl(this.remoteDataSource);

  @override
  Future<ApiResult<DressingResponseModel>> sendDressing(
      DressingRequestModel dressingRequestModel) async {
    try {
      final response =
          await remoteDataSource.sendDressingRequest(dressingRequestModel);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
