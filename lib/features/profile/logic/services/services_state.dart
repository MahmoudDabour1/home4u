import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/auth/sign_up/data/models/services/freelancer_services.dart';

import '../../data/models/services/Service_update_delete_response_model.dart';


part 'services_state.freezed.dart';

@freezed
class ServicesState<T> with _$ServicesState<T> {
  const factory ServicesState.initial() = _Initial;

  ///Get Services
  const factory ServicesState.getServicesLoading() = GetServicesLoading;

  const factory ServicesState.getServicesSuccess(
      FreelancerServices servicesData) = GetServicesSuccess;

  const factory ServicesState.getServicesError({required String error}) =
      GetServicesError;

  ///Update Services
  const factory ServicesState.updateServicesLoading() = UpdateServicesLoading;

  const factory ServicesState.updateServicesSuccess(ServiceUpdateDeleteResponseModel serviceResponse) = UpdateServicesSuccess;

  const factory ServicesState.updateServicesError({required String error}) =
      UpdateServicesError;

  ///Delete Service
  const factory ServicesState.deleteServiceLoading() = DeleteServiceLoading;

  const factory ServicesState.deleteServiceSuccess(ServiceUpdateDeleteResponseModel serviceResponse) = DeleteServiceSuccess;

  const factory ServicesState.deleteServiceError({required String error}) =
      DeleteServiceError;
}
