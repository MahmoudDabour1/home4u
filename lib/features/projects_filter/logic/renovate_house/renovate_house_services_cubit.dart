import 'package:bloc/bloc.dart';
import 'package:home4u/features/projects_filter/logic/renovate_house/renovate_house_services_state.dart';

import '../../data/models/add_request/renovate_house/add_renovate_house_request_body.dart';
import '../../data/repository/renovate_house_services_repository.dart';

class RenovateHouseServicesCubit extends Cubit<RenovateHouseServicesState> {
  final RenovateHouseServicesRepository _renovateHouseServicesRepository;

  RenovateHouseServicesCubit(this._renovateHouseServicesRepository)
      : super(const RenovateHouseServicesState.initial());

  /// Renovate House Asks
  Future<void> getRenovateHouseAsks({
    required String askId,
  }) async {
    emit(RenovateHouseServicesState.renovateHouseAsksLoading());
    final result =
        await _renovateHouseServicesRepository.getRenovateHouseAsks(askId);

    result.when(
      success: (data) =>
          emit(RenovateHouseServicesState.renovateHouseAsksSuccess(data)),
      failure: (error) => emit(
        RenovateHouseServicesState.renovateHouseAsksFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }

  /// Renovate House Service Details
  Future<void> renovateHouseServiceDetails({
    required String requestId,
  }) async {
    emit(RenovateHouseServicesState.renovateHouseServiceDetailsLoading());
    final result =
        await _renovateHouseServicesRepository.renovateHouseDetails(requestId);

    result.when(
      success: (data) => emit(
          RenovateHouseServicesState.renovateHouseServiceDetailsSuccess(data)),
      failure: (error) => emit(
        RenovateHouseServicesState.renovateHouseServiceDetailsFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }

  /// Renovate House Service Request
  Future<void> requestRenovateHouse({
    required AddRenovateHouseRequestBody renovateHouseRequestBody,
  }) async {
    emit(RenovateHouseServicesState.renovateHouseServiceRequestLoading());
    final result = await _renovateHouseServicesRepository
        .requestAskRenovateHouse(renovateHouseRequestBody);

    result.when(
      success: (data) => emit(
          RenovateHouseServicesState.renovateHouseServiceRequestSuccess(data)),
      failure: (error) => emit(
        RenovateHouseServicesState.renovateHouseServiceRequestFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }

  /// Renovate House Service Requests
  Future<void> getRenovateHouseServiceRequests({
    required String askId,
  }) async {
    emit(RenovateHouseServicesState.renovateHouseServiceRequestsLoading());
    final result = await _renovateHouseServicesRepository
        .getAskRenovateHouseRequests(askId);

    result.when(
      success: (data) => emit(
          RenovateHouseServicesState.renovateHouseServiceRequestsSuccess(data)),
      failure: (error) => emit(
        RenovateHouseServicesState.renovateHouseServiceRequestsFailure(
          error: error.message.toString(),
        ),
      ),
    );
  }
}
