part of 'technical_worker_cubit.dart';

@freezed
class TechnicalWorkerState<T> with _$TechnicalWorkerState<T> {
  const factory TechnicalWorkerState.initial() = _Initial;

  ///TechnicalWorkerServices
  const factory TechnicalWorkerState.loadingTechnicalWorkerServices() =
      LoadingTechnicalWorkerServices;

  const factory TechnicalWorkerState.successTechnicalWorkerServices(T data) =
      SuccessTechnicalWorkerServices<T>;

  const factory TechnicalWorkerState.errorTechnicalWorkerServices(
      {required String error}) = ErrorTechnicalWorkerServices;

  ///TechnicalWorkerTypes

  const factory TechnicalWorkerState.loadingTechnicalWorkerTypes() =
      LoadingTechnicalWorkerTypes;

  const factory TechnicalWorkerState.successTechnicalWorkerTypes(T data) =
      SuccessTechnicalWorkerTypes<T>;

  const factory TechnicalWorkerState.errorTechnicalWorkerTypes(
      {required String error}) = ErrorTechnicalWorkerTypes;
}
