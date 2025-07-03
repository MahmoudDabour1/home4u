import 'package:dio/dio.dart';
import 'package:home4u/core/networking/api_constants.dart';
import 'package:home4u/features/projects_filter/data/models/details/renovate_house_details_response_model.dart';
import 'package:home4u/features/projects_filter/data/models/details/request_design_project_details_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../models/details/ask_engineer_project_details_response_model.dart';
import '../../models/details/ask_technical_project_details_response_model.dart';
import '../../models/details/renovate_house_fixed_package_details_response_model.dart';

part 'project_details_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProjectDetailsRemoteDataSource {
  factory ProjectDetailsRemoteDataSource(Dio dio, {String baseUrl}) =
      _ProjectDetailsRemoteDataSource;

  @GET(ApiConstants.askTechnicalServiceDetailsEp)
  Future<AskTechnicalProjectDetailsResponseModel> askTechnicalServiceDetails(
    @Query('askId') String askId,
  );

  @GET(ApiConstants.askEngineerServiceDetailsEp)
  Future<AskEngineerProjectDetailsResponseModel> askEngineerServiceDetails(
    @Query('askId') String askId,
  );

  @GET(ApiConstants.renovateHouseDetailsEp)
  Future<RenovateHouseDetailsResponseModel> renovateHouseDetails(
    @Query('renovateId') String renovateId,
  );

  @GET(ApiConstants.renovateHouseFixedPackageDetailsEp)
  Future<RenovateHouseFixedPackageDetailsResponseModel> renovateHouseFixedPackageDetails(
    @Query('packageId') String packageId,
  );

  @GET(ApiConstants.requestDesignDetailsEp)
  Future<RequestDesignProjectDetailsResponseModel> requestDesignDetails(
    @Query('requestId') String requestId,
  );
}
