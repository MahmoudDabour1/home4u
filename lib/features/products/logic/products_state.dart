import 'package:freezed_annotation/freezed_annotation.dart';

part "products_state.freezed.dart";

@freezed
 class ProductsState<T> with _$ProductsState<T> {
  const factory ProductsState.initial() = _Initial;
  const factory ProductsState.businessConfigLoading() = BusinessConfigLoading;
  const factory ProductsState.businessConfigSuccess(T data) =  BusinessConfigSuccess;
  const factory ProductsState.businessConfigFailure({required String errorMessage}) =  BusinessConfigFailure;

}

