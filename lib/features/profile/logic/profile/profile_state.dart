import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/certifications/get_certifications_response_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState<T> with _$ProfileState<T> {
  const factory ProfileState.initial() = ProfileInitial;

  //certifications
  const factory ProfileState.getAllCertificationsLoading() = CertificationsLoadingState;
  const factory ProfileState.getAllCertificationsSuccess(List<CertificationsData?>? certificationsData) = CertificationsSuccessState;
  const factory ProfileState.getAllCertificationsFailure({required String errorMessage}) =
  CertificationsFailureState;
}
