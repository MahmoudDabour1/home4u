import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/profile/data/models/certifications/get_certifications_response_model.dart';

part 'certifications_state.freezed.dart';

@freezed
class CertificationsState<T> with _$CertificationsState<T> {
  const factory CertificationsState.initial() = _Initial;

  //getAllCertifications
  const factory CertificationsState.getAllCertificationsLoading() =
      CertificationsLoadingState;

  const factory CertificationsState.getAllCertificationsSuccess(
          List<CertificationsData?>? certificationsData) =
      CertificationsSuccessState;

  const factory CertificationsState.getAllCertificationsFailure(
      {required String errorMessage}) = CertificationsFailureState;

  //Delete Certification
  const factory CertificationsState.deleteCertificationLoading() =
      DeleteCertificationLoading;

  const factory CertificationsState.deleteCertificationSuccess() =
      DeleteCertificationSuccess;

  const factory CertificationsState.deleteCertificationError(
      {required String error}) = DeleteCertificationError;

  //Add Certification
  const factory CertificationsState.addCertificationLoading() =
      AddCertificationLoading;
  const factory CertificationsState.addCertificationSuccess() =
      AddCertificationSuccess;
  const factory CertificationsState.addCertificationError({required String errorMessage})=
      AddCertificationError;

  //add image
  const factory CertificationsState.addImage() = AddImage;

  //update Certification
  const factory CertificationsState.updateCertificationLoading() =
      UpdateCertificationLoading;
  const factory CertificationsState.updateCertificationSuccess() =
      UpdateCertificationSuccess;
  const factory CertificationsState.updateCertificationError({required String errorMessage})=
      UpdateCertificationError;

  //get Certification by Id
  const factory CertificationsState.getCertificationByIdLoading() =
      GetCertificationByIdLoading;
  const factory CertificationsState.getCertificationByIdSuccess(
          GetCertificationsResponseModel getCertificationResponseModel) =
      GetCertificationByIdSuccess;
  const factory CertificationsState.getCertificationByIdError(
      {required String errorMessage}) = GetCertificationByIdError;
}
