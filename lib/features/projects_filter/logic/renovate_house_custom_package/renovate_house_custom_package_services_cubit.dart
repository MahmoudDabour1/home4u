import 'package:bloc/bloc.dart';
import 'package:home4u/features/projects_filter/data/repository/renovate_house_custom_package_services_repository.dart';
import 'package:home4u/features/projects_filter/logic/renovate_house_custom_package/renovate_house_custom_package_services_state.dart';

import '../../data/models/add_request/renovate_house_custom_package/add_renovate_house_custom_package_request_body.dart';

class RenovateHouseCustomPackageServicesCubit
    extends Cubit<RenovateHouseCustomPackageServicesState> {
  final RenovateHouseCustomPackageServicesRepository
      _renovateHouseCustomPackageServicesRepository;

  RenovateHouseCustomPackageServicesCubit(
      this._renovateHouseCustomPackageServicesRepository)
      : super(const RenovateHouseCustomPackageServicesState.initial());

  /// Renovate House Custom Package Details
  Future<void> renovateHouseCustomPackageServiceDetails({
    required String packageId,
  }) async {
    emit(RenovateHouseCustomPackageServicesState
        .renovateHouseCustomPackageServiceDetailsLoading());
    final result = await _renovateHouseCustomPackageServicesRepository
        .renovateHouseFixedPackageDetails(packageId: packageId);

    result.when(
      success: (data) => emit(RenovateHouseCustomPackageServicesState
          .renovateHouseCustomPackageServiceDetailsSuccess(data)),
      failure: (error) => emit(
        RenovateHouseCustomPackageServicesState
            .renovateHouseCustomPackageServiceDetailsFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }

  /// Renovate House Custom Package Asks
  Future<void> getRenovateHouseCustomPackageAsks({
    required String askId,
  }) async {
    emit(RenovateHouseCustomPackageServicesState
        .renovateHouseCustomPackageAsksLoading());
    final result = await _renovateHouseCustomPackageServicesRepository
        .getRenovateHouseCustomPackageAsks(askId: askId);

    result.when(
      success: (data) => emit(RenovateHouseCustomPackageServicesState
          .renovateHouseCustomPackageAsksSuccess(data)),
      failure: (error) => emit(
        RenovateHouseCustomPackageServicesState
            .renovateHouseCustomPackageAsksFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }

  ///Request Renovate House Custom Package Service
  Future<void> requestRenovateHouseCustomPackage({
    required AddRenovateHouseCustomPackageRequestBody
        addRenovateHouseCustomPackageRequestBody,
  }) async {
    emit(RenovateHouseCustomPackageServicesState
        .renovateHouseCustomPackageServiceRequestLoading());
    final result = await _renovateHouseCustomPackageServicesRepository
        .requestAskRenovateHouseCustomPackage(
            askRenovateHouseCustomPackageRequestBody:
                addRenovateHouseCustomPackageRequestBody);

    result.when(
      success: (data) => emit(RenovateHouseCustomPackageServicesState
          .renovateHouseCustomPackageServiceRequestSuccess(data)),
      failure: (error) => emit(
        RenovateHouseCustomPackageServicesState
            .renovateHouseCustomPackageServiceRequestFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }

  /// Renovate House Custom Package Service Requests
  Future<void> getRenovateHouseCustomPackageRequests({
    required String requestId,
  }) async {
    emit(RenovateHouseCustomPackageServicesState
        .renovateHouseCustomPackageServiceRequestsLoading());
    final result = await _renovateHouseCustomPackageServicesRepository
        .getAskRenovateHouseCustomPackageRequests(askId: requestId);

    result.when(
      success: (data) => emit(RenovateHouseCustomPackageServicesState
          .renovateHouseCustomPackageServiceRequestsSuccess(data)),
      failure: (error) => emit(
        RenovateHouseCustomPackageServicesState
            .renovateHouseCustomPackageServiceRequestsFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }
}
