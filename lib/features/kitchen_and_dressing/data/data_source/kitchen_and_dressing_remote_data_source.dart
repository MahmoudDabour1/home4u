import 'package:dio/dio.dart';
import 'package:home4u/core/networking/api_constants.dart';
import 'package:home4u/features/kitchen_and_dressing/data/models/dressing_request_model.dart';
import 'package:home4u/features/kitchen_and_dressing/data/models/dressing_response_model.dart';
import 'package:home4u/features/kitchen_and_dressing/data/models/kitchen_request_model.dart';
import 'package:home4u/features/kitchen_and_dressing/data/models/kitchen_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'kitchen_and_dressing_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class KitchenAndDressingRemoteDataSource {
  factory KitchenAndDressingRemoteDataSource(Dio dio) {
    return _KitchenAndDressingRemoteDataSource(dio);
  }

  @POST(ApiConstants.sendFurnishYourHomeEp)
  Future<DressingResponseModel> sendDressingRequest(
    @Body() DressingRequestModel requestModel,
  );

  @POST(ApiConstants.sendFurnishYourHomeEp)
  Future<KitchenResponseModel> sendKitchenRequest(
    @Body() KitchenRequestModel requestModel,
  );
}
