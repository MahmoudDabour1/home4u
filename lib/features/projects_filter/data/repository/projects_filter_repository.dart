import 'package:home4u/core/networking/api_error_handler.dart';
import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/projects_filter/data/models/ask_filter/engineer/ask_engineer_filter_body.dart';
import 'package:home4u/features/projects_filter/data/models/ask_filter/engineer/ask_engineer_filter_response_model.dart';

import '../data_source/projects_filter_remote_data_source.dart';
import '../models/ask_filter/ask_technical_worker_filter_body.dart';
import '../models/ask_filter/ask_technical_worker_filter_response_model.dart';
import '../models/renovate_house_filter/renovate_house_filter_body.dart';
import '../models/renovate_house_filter/renovate_house_filter_response_model.dart';
import '../models/renovate_house_filter/renovate_house_fixed_package_filter_response_model.dart';
import '../models/request_design_filter/request_design_filter_body.dart';
import '../models/request_design_filter/request_design_filter_response_model.dart';

abstract class ProjectsFilterRepository {
  Future<ApiResult<AskTechnicalWorkerFilterResponseModel>>
      askTechnicalWorkerFilter(
    AskTechnicalWorkerFilterBody askTechnicalWorkerFilterBody,
  );

  Future<ApiResult<AskEngineerFilterResponseModel>> askEngineerFilter(
    AskEngineerFilterBody askEngineerFilterBody,
  );

  Future<ApiResult<RenovateHouseFilterResponseModel>> renovateHouseFilter(
    RenovateHouseFilterBody renovateHouseFilterBody,
  );

  Future<ApiResult<RenovateHouseFixedPackageFilterResponseModel>>
      renovateHouseFixedPackageFilter(
    Map<String, dynamic> renovateHouseFixedPackageFilterBody,
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

  @override
  Future<ApiResult<AskEngineerFilterResponseModel>> askEngineerFilter(
      AskEngineerFilterBody askEngineerFilterBody) async {
    try {
      final response =
          await remoteDataSource.askEngineerFilter(askEngineerFilterBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e.toString()));
    }
  }

  @override
  Future<ApiResult<RenovateHouseFixedPackageFilterResponseModel>>
      renovateHouseFixedPackageFilter(
    Map<String, dynamic> renovateHouseFixedPackageFilterBody,
  ) async {
    try {
      final response = await remoteDataSource
          .renovateHouseFixedPackageFilter(renovateHouseFixedPackageFilterBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e.toString()));
    }
  }
}
