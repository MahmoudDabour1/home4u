import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/projects_filter/data/models/asks/technical_asks_response_model.dart';

import '../../data/models/asks/engineer_ask/engineer_asks_response_model.dart';
import '../../data/models/asks/renovate_house_ask/renovate_house_asks_response_model.dart';
import '../../data/models/asks/renovate_house_custom_package_ask/renovate_house_custom_package_asks_response_model.dart';
import '../../data/models/asks/request_design_ask/request_design_asks_response_model.dart';

part 'asks_state.freezed.dart';

@freezed
class AsksState with _$AsksState {
  const factory AsksState.initial() = _Initial;

  ///Technical Asks
  factory AsksState.technicalAsksLoading() = TechnicalAsksLoading;

  factory AsksState.technicalAsksSuccess(
      TechnicalAsksResponseModel technicalAsk) = TechnicalAsksSuccess;

  factory AsksState.technicalAsksFailure({required String error}) =
      TechnicalAsksFailure;

  ///Engineer Asks
  factory AsksState.engineerAsksLoading() = EngineerAsksLoading;

  factory AsksState.engineerAsksSuccess(EngineerAsksResponseModel engineerAsk) =
      EngineerAsksSuccess;

  factory AsksState.engineerAsksFailure({required String error}) =
      EngineerAsksFailure;

  ///Request Design Asks
  factory AsksState.requestDesignAsksLoading() = RequestDesignAsksLoading;

  factory AsksState.requestDesignAsksSuccess(
          RequestDesignAsksResponseModel requestDesignAsk) =
      RequestDesignAsksSuccess;

  factory AsksState.requestDesignAsksFailure({required String error}) =
      RequestDesignAsksFailure;

  ///Renovate House Custom Package Asks
  factory AsksState.renovateHouseCustomPackageAsksLoading() =
      RenovateHouseCustomPackageAsksLoading;

  factory AsksState.renovateHouseCustomPackageAsksSuccess(
          RenovateHouseCustomPackageAsksResponseModel
              renovateHouseCustomPackageAsk) =
      RenovateHouseCustomPackageAsksSuccess;

  factory AsksState.renovateHouseCustomPackageAsksFailure(
      {required String error}) = RenovateHouseCustomPackageAsksFailure;

  ///Renovate House Asks
  factory AsksState.renovateHouseAsksLoading() = RenovateHouseAsksLoading;

  factory AsksState.renovateHouseAsksSuccess(
          RenovateHouseAsksResponseModel renovateHouseAsk) =
      RenovateHouseAsksSuccess;

  factory AsksState.renovateHouseAsksFailure({required String error}) =
      RenovateHouseAsksFailure;
}
