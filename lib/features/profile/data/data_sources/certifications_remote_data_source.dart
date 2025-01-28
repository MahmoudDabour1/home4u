import 'package:dio/dio.dart';
import 'package:home4u/features/profile/data/models/certifications/add_certification_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/certifications/delete_certification_response_model.dart';
import '../models/certifications/get_certifications_response_model.dart';

part 'certifications_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class CertificationsRemoteDataSource {
  factory CertificationsRemoteDataSource(Dio dio, {String baseUrl}) =
      _CertificationsRemoteDataSource;

  @GET(ApiConstants.getAllCertificationsEp)
  Future<GetCertificationsResponseModel> getCertifications();

  @DELETE("/api/v1/certificate/{certificationId}")
  Future<DeleteCertificationResponseModel> deleteCertification(
    @Path("certificationId") int certificationId,
  );

  @POST(ApiConstants.addCertificationsEp)
  Future<AddCertificationResponseModel> addCertification(
    @Body() FormData formData,
      );
}
