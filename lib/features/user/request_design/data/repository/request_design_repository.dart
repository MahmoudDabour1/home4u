import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/user/request_design/data/models/request_design_body.dart';
import 'package:home4u/features/user/request_design/data/models/request_design_response_model.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../data_source/request_design_remote_data_source.dart';

abstract class RequestDesignRepository {
  Future<ApiResult<RequestDesignResponseModel>> requestDesign(
      RequestDesignBody requestDesignBody,);
}

class RequestDesignRepositoryImpl implements RequestDesignRepository {
  final RequestDesignRemoteDataSource remoteDataSource;

  RequestDesignRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<ApiResult<RequestDesignResponseModel>> requestDesign(
      RequestDesignBody requestDesignBody,) async {
    try {
      final response = await remoteDataSource.requestDesign(requestDesignBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
