import 'package:dio/dio.dart';
import 'package:home4u/core/networking/api_constants.dart';
import 'package:home4u/features/projects_filter/data/models/asks/technical_asks_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../models/asks/engineer_ask/engineer_asks_response_model.dart';
import '../../models/asks/renovate_house_ask/renovate_house_asks_response_model.dart';
import '../../models/asks/renovate_house_custom_package_ask/renovate_house_custom_package_asks_response_model.dart';
import '../../models/asks/request_design_ask/request_design_asks_response_model.dart';

part 'asks_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class AsksRemoteDataSource {
  factory AsksRemoteDataSource(Dio dio, {String baseUrl}) =
      _AsksRemoteDataSource;

  @GET(ApiConstants.technicalAsksEp)
  Future<TechnicalAsksResponseModel> getTechnicalAsks(
    @Query('askId') String askId,
  );

  @GET(ApiConstants.engineerAsksEp)
  Future<EngineerAsksResponseModel> getEngineerAsks(
    @Query('askId') String askId,
  );

  @GET(ApiConstants.requestDesignAsksEp)
  Future<RequestDesignAsksResponseModel> getRequestDesignAsks(
    @Query('askId') String askId,
  );

  @GET(ApiConstants.renovateHouseFixedPackageAsksEp)
  Future<RenovateHouseCustomPackageAsksResponseModel>
      getRenovateHouseCustomPackageAsks(
    @Query('askId') String askId,
  );

  @GET(ApiConstants.renovateHouseAsksEp)
  Future<RenovateHouseAsksResponseModel> getRenovateHouseAsks(
    @Query('askId') String askId,
  );
}
