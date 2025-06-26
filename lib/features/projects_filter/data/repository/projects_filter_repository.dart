import 'package:home4u/core/networking/api_error_handler.dart';
import 'package:home4u/core/networking/api_result.dart';

import '../data_source/projects_filter_remote_data_source.dart';
import '../models/ask_filter/ask_technical_worker_filter_body.dart';
import '../models/ask_filter/ask_technical_worker_filter_response_model.dart';
import '../models/renovate_house_filter/renovate_house_filter_body.dart';
import '../models/renovate_house_filter/renovate_house_filter_response_model.dart';
import '../models/request_design_filter/request_design_filter_body.dart';
import '../models/request_design_filter/request_design_filter_response_model.dart';

abstract class ProjectsFilterRepository {
  Future<ApiResult<AskTechnicalWorkerFilterResponseModel>>
      askTechnicalWorkerFilter(
    AskTechnicalWorkerFilterBody askTechnicalWorkerFilterBody,
  );

  Future<ApiResult<RenovateHouseFilterResponseModel>> renovateHouseFilter(
    RenovateHouseFilterBody renovateHouseFilterBody,
  );

  Future<ApiResult<RequestDesignFilterResponseModel>> requestDesignFilter(
    RequestDesignFilterBody requestDesignFilterBody,
  );
}

class ProjectsFilterRepositoryImpl implements ProjectsFilterRepository {
  final ProjectsFilterRemoteDataSource remoteDataSource;

  ProjectsFilterRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResult<AskTechnicalWorkerFilterResponseModel>>
      askTechnicalWorkerFilter(
    AskTechnicalWorkerFilterBody askTechnicalWorkerFilterBody,
  ) async {
    try {
      final response = await remoteDataSource
          .askTechnicalWorkerFilter(askTechnicalWorkerFilterBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e.toString()));
    }
  }

  @override
  Future<ApiResult<RenovateHouseFilterResponseModel>> renovateHouseFilter(
    RenovateHouseFilterBody renovateHouseFilterBody,
  ) async {
    try {
      final response =
          await remoteDataSource.renovateHouseFilter(renovateHouseFilterBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e.toString()));
    }
  }

  @override
  Future<ApiResult<RequestDesignFilterResponseModel>> requestDesignFilter(
    RequestDesignFilterBody requestDesignFilterBody,
  ) async {
    try {
      final response =
          await remoteDataSource.requestDesignFilter(requestDesignFilterBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e.toString()));
    }
  }
}
