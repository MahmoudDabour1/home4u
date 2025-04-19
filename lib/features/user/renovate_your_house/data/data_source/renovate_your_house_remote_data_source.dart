import 'package:dio/dio.dart';
import 'package:home4u/features/user/renovate_your_house/data/models/renovate_your_house_fixed_packages_model.dart';
import 'package:home4u/features/user/renovate_your_house/data/models/renovate_your_house_look_ups_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/networking/api_constants.dart';
import '../models/add_renovate_house_custom_package_body.dart';
import '../models/renovate_your_house_choose_fixed_package_body.dart';
import '../models/renovate_your_house_response_model.dart';

part 'renovate_your_house_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class RenovateYourHouseRemoteDataSource {
  factory RenovateYourHouseRemoteDataSource(Dio dio, {String baseUrl}) =
      _RenovateYourHouseRemoteDataSource;

  @GET(ApiConstants.renovateYourHouseLookUpsEp)
  Future<RenovateYourHouseLookUpsModel> getRenovateYourHouseLookUps();

  @GET(ApiConstants.renovateYourHouseFixedPackagesEp)
  Future<RenovateYourHouseFixedPackagesModel>
      getRenovateYourHouseFixedPackages();

  @POST(ApiConstants.renovateYourHouseEp)
  Future<RenovateYourHouseResponseModel> addCustomPackageRenovateYourHouse(
    @Body() AddRenovateHouseCustomPackageBody addRenovateHouseCustomPackageBody,
  );

  @POST(ApiConstants.renovateYourHouseChooseFixedPackageEp)
  Future<RenovateYourHouseResponseModel> chooseFixedPackageRenovateYourHouse(
    @Body()
    RenovateYourHouseChooseFixedPackageBody
        renovateYourHouseChooseFixedPackageBody,
  );
}
