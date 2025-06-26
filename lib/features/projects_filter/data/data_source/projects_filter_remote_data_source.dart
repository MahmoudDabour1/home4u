import 'package:dio/dio.dart';
import 'package:home4u/features/projects_filter/data/models/ask_filter/engineer/ask_engineer_filter_body.dart';
import 'package:home4u/features/projects_filter/data/models/ask_filter/engineer/ask_engineer_filter_response_model.dart';
import 'package:home4u/features/projects_filter/data/models/renovate_house_filter/renovate_house_filter_body.dart';
import 'package:home4u/features/projects_filter/data/models/renovate_house_filter/renovate_house_filter_response_model.dart';
import 'package:home4u/features/projects_filter/data/models/request_design_filter/request_design_filter_body.dart';
import 'package:home4u/features/projects_filter/data/models/request_design_filter/request_design_filter_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/ask_filter/ask_technical_worker_filter_body.dart';
import '../models/ask_filter/ask_technical_worker_filter_response_model.dart';
import '../models/renovate_house_filter/renovate_house_fixed_package_filter_response_model.dart';

part 'projects_filter_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProjectsFilterRemoteDataSource {
  factory ProjectsFilterRemoteDataSource(Dio dio, {String baseUrl}) =
      _ProjectsFilterRemoteDataSource;

  @POST(ApiConstants.askTechnicalWorkerFilterEp)
  Future<AskTechnicalWorkerFilterResponseModel> askTechnicalWorkerFilter(
    @Body() AskTechnicalWorkerFilterBody body,
  );

  @POST(ApiConstants.renovateHouseFilterEp)
  Future<RenovateHouseFilterResponseModel> renovateHouseFilter(
    @Body() RenovateHouseFilterBody body,
  );

  @POST(ApiConstants.renovateHouseFixedPackageFilterEp)
  Future<RenovateHouseFixedPackageFilterResponseModel> renovateHouseFixedPackageFilter(
    @Body() Map<String,dynamic> fixedPackageBody,
  );


  @POST(ApiConstants.requestDesignFilterEp)
  Future<RequestDesignFilterResponseModel> requestDesignFilter(
    @Body() RequestDesignFilterBody body,
  );

  @POST(ApiConstants.askEngineerFilterEp)
  Future<AskEngineerFilterResponseModel> askEngineerFilter(
    @Body() AskEngineerFilterBody body,
  );
}
