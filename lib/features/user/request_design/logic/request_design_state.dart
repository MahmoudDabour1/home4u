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
}
