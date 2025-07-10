import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/products/data/models/delete_product_model.dart';
import 'package:home4u/features/products/data/models/product_preview_response.dart';
import 'package:home4u/features/products/data/models/products_response_model.dart';

part "products_state.freezed.dart";

@freezed
class ProductsState<T> with _$ProductsState<T> {
  const factory ProductsState.initial() = _Initial;

  const factory ProductsState.businessConfigLoading() = BusinessConfigLoading;

  const factory ProductsState.businessConfigSuccess(T data) =
      BusinessConfigSuccess;

  const factory ProductsState.businessConfigFailure(
      {required String errorMessage}) = BusinessConfigFailure;

  ///get products
  const factory ProductsState.getProductsLoading() = GetProductsLoading;

  const factory ProductsState.getProductsSuccess(
      ProductsResponseModel responseModel) = GetProductsSuccess;

  const factory ProductsState.getProductsFailure(
      {required String errorMessage}) = GetProductsFailure;

  ///delete product
  const factory ProductsState.deleteProductLoading() = DeleteProductLoading;

  const factory ProductsState.deleteProductSuccess(
      DeleteProductModel deleteProductModel) = DeleteProductSuccess;

  const factory ProductsState.deleteProductFailure(
      {required String errorMessage}) = DeleteProductFailure;

  ///product preview
  const factory ProductsState.getProductPreviewLoading() =
      GetProductPreviewLoading;

  const factory ProductsState.getProductPreviewSuccess(
      ProductPreviewResponse product) = GetProductPreviewSuccess;

  const factory ProductsState.getProductPreviewFailure(
      {required String errorMessage}) = GetProductPreviewFailure;

  ///pagination
  const factory ProductsState.paginationLoading() = PaginationLoading;

  const factory ProductsState.paginationFailure(
      {required String errorMessage}) = PaginationFailure;

  ///reset Filter
  const factory ProductsState.resetFilter() = ResetFilter;
}
