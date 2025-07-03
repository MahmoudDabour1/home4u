import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/projects_filter/data/models/details/ask_engineer_project_details_response_model.dart';
import 'package:home4u/features/projects_filter/data/models/details/ask_technical_project_details_response_model.dart';
import 'package:home4u/features/projects_filter/data/models/details/renovate_house_fixed_package_details_response_model.dart';
import 'package:home4u/features/projects_filter/data/models/details/request_design_project_details_response_model.dart';

import '../../data/models/details/renovate_house_details_response_model.dart';

part 'project_details_state.freezed.dart';

@freezed
class ProjectDetailsState<T> with _$ProjectDetailsState<T> {
  const factory ProjectDetailsState.initial() = _Initial;

  ///Ask Technical Details
  const factory ProjectDetailsState.askTechnicalDetailsLoading() =
      AskTechnicalDetailsLoading;

  const factory ProjectDetailsState.askTechnicalDetailsSuccess(
          AskTechnicalProjectDetailsResponseModel data) =
      AskTechnicalDetailsSuccess;

  const factory ProjectDetailsState.askTechnicalDetailsFailure(
      {required String error}) = AskTechnicalDetailsFailure;

  ///Ask Engineer Details
  const factory ProjectDetailsState.askEngineerDetailsLoading() =
      AskEngineerDetailsLoading;

  const factory ProjectDetailsState.askEngineerDetailsSuccess(
      AskEngineerProjectDetailsResponseModel data) = AskEngineerDetailsSuccess;

  const factory ProjectDetailsState.askEngineerDetailsFailure(
      {required String error}) = AskEngineerDetailsFailure;

  ///Renovate House Details
  const factory ProjectDetailsState.renovateHouseDetailsLoading() =
      RenovateHouseDetailsLoading;

  const factory ProjectDetailsState.renovateHouseDetailsSuccess(
      RenovateHouseDetailsResponseModel data) =
      RenovateHouseDetailsSuccess;

  const factory ProjectDetailsState.renovateHouseDetailsFailure(
      {required String error}) = RenovateHouseDetailsFailure;

  ///Renovate House Fixed Package Details
  const factory ProjectDetailsState.renovateHouseFixedPackageDetailsLoading() =
      RenovateHouseFixedPackageDetailsLoading;

  const factory ProjectDetailsState.renovateHouseFixedPackageDetailsSuccess(
          RenovateHouseFixedPackageDetailsResponseModel data) =
      RenovateHouseFixedPackageDetailsSuccess;

  const factory ProjectDetailsState.renovateHouseFixedPackageDetailsFailure(
      {required String error}) = RenovateHouseFixedPackageDetailsFailure;

  ///Request Design Details
  const factory ProjectDetailsState.requestDesignDetailsLoading() =
      RequestDesignDetailsLoading;

  const factory ProjectDetailsState.requestDesignDetailsSuccess(
          RequestDesignProjectDetailsResponseModel data) =
      RequestDesignDetailsSuccess;

  const factory ProjectDetailsState.requestDesignDetailsFailure(
      {required String error}) = RequestDesignDetailsFailure;
}
