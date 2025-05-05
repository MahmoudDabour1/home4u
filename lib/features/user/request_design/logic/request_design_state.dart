import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_design_state.freezed.dart';

@freezed
class RequestDesignState<T> with _$RequestDesignState<T> {
  const factory RequestDesignState.initial() = _Initial;

  ///Add Request Design
  factory RequestDesignState.addRequestDesignLoading() =
      AddRequestDesignLoading;

  factory RequestDesignState.addRequestDesignSuccess(T data) =
      AddRequestDesignSuccess;

  factory RequestDesignState.addRequestDesignFailure({required String error}) =
      AddRequestDesignFailure;

  ///Request Design Filter
  factory RequestDesignState.requestDesignFilterLoading() =
      RequestDesignFilterLoading;

  factory RequestDesignState.requestDesignFilterSuccess(T data) =
      RequestDesignFilterSuccess;

  factory RequestDesignState.requestDesignFilterFailure(
      {required String error}) = RequestDesignFilterFailure;

  ///Pagination
  factory RequestDesignState.paginationLoading() =
      RequestDesignPaginationLoading;

  factory RequestDesignState.paginationFailure({required String error}) =
      RequestDesignPaginationFailure;
}
