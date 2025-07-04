import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/renovate_house_filter/renovate_house_filter_response_model.dart';
import '../../data/models/request_design_filter/request_design_filter_response_model.dart';


part 'projects_filter_state.freezed.dart';

@freezed
class ProjectsFilterState<T> with _$ProjectsFilterState<T> {
  const factory ProjectsFilterState.initial() = _Initial;

  ///Request Design Filter
  factory ProjectsFilterState.requestDesignFilterLoading() =
      RequestDesignFilterLoading;

  factory ProjectsFilterState.requestDesignFilterSuccess(
      RequestDesignFilterResponseModel data) = RequestDesignFilterSuccess;

  factory ProjectsFilterState.requestDesignFilterFailure(
      {required String error}) = RequestDesignFilterFailure;

  ///RenovateYourHouseFixedPackagesFilter
  factory ProjectsFilterState.renovateYourHouseFixedPackagesFilterLoading() =
      RenovateYourHouseFixedPackagesFilterLoading;

  factory ProjectsFilterState.renovateYourHouseFixedPackagesFilterLoaded(
      T data) = RenovateYourHouseFixedPackagesFilterLoaded;

  factory ProjectsFilterState.renovateYourHouseFixedPackagesFilterError(
      {required String error}) = RenovateYourHouseFixedPackagesFilterError;

  ///RenovateYourHouseCustomPackagesFilter
  factory ProjectsFilterState.renovateYourHouseCustomPackagesFilterLoading() =
      RenovateYourHouseCustomPackagesFilterLoading;

  factory ProjectsFilterState.renovateYourHouseCustomPackagesFilterLoaded(
          RenovateHouseFilterResponseModel data) =
      RenovateYourHouseCustomPackagesFilterLoaded;

  factory ProjectsFilterState.renovateYourHouseCustomPackagesFilterError(
      {required String error}) = RenovateYourHouseCustomPackagesFilterError;

  ///AskTechnicalWorkerFilter
  factory ProjectsFilterState.askTechnicalWorkerFilterLoading() =
      AskTechnicalWorkerFilterLoading;

  factory ProjectsFilterState.askTechnicalWorkerFilterSuccess(T data) =
      AskTechnicalWorkerFilterSuccess;

  factory ProjectsFilterState.askTechnicalWorkerFilterFailure(
      {required String error}) = AskTechnicalWorkerFilterFailure;

  ///Ask Engineer Filter
  factory ProjectsFilterState.askEngineerFilterLoading() =
      AskEngineerFilterLoading;

  factory ProjectsFilterState.askEngineerFilterSuccess(T data) =
      AskEngineerFilterSuccess;

  factory ProjectsFilterState.askEngineerFilterFailure(
      {required String error}) = AskEngineerFilterFailure;

  ///Pagination
  factory ProjectsFilterState.paginationLoading() =
      RequestDesignPaginationLoading;

  factory ProjectsFilterState.paginationFailure({required String error}) =
      RequestDesignPaginationFailure;
}
