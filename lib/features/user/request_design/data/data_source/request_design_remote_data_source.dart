import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:home4u/features/user/request_design/data/models/request_design_response_model.dart';

import '../../../../../core/networking/api_constants.dart';
import '../models/request_design_body.dart';
import 'package:retrofit/retrofit.dart';

part 'request_design_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class RequestDesignRemoteDataSource {
  factory RequestDesignRemoteDataSource(Dio dio, {String baseUrl}) =
      _RequestDesignRemoteDataSource;

  @POST(ApiConstants.requestDesignEp)
  Future<RequestDesignResponseModel> requestDesign(
    @Body() RequestDesignBody requestDesignBody,
  );
}


