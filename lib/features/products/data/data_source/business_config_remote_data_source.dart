
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/business_config_model.dart';

part 'business_config_remote_data_source.g.dart';
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class BusinessConfigRemoteDataSource{
  factory BusinessConfigRemoteDataSource(Dio dio, {String baseUrl}) = _BusinessConfigRemoteDataSource;

  @GET(ApiConstants.businessConfigEP)
  Future<BusinessConfigModel> getBusinessConfig();


}
