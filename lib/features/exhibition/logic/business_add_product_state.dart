import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/add_product_business_response_model.dart';
import '../data/models/business_add_product_images_response.dart';
import '../data/models/upload_image_response.dart';

part 'business_add_product_state.freezed.dart';

@freezed
class BusinessAddProductState<T> with _$BusinessAddProductState<T> {
  const factory BusinessAddProductState.initial() = _Initial;

  ///AddBusinessProduct
  const factory BusinessAddProductState.addBusinessProductLoading() =
      AddBusinessProductLoading;

  const factory BusinessAddProductState.addBusinessProductSuccess(
      AddProductBusinessResponseModel response) = AddBusinessProductSuccess;

  const factory BusinessAddProductState.addBusinessProductFailure(
      String error) = AddBusinessProductFailure;

  ///AddBusinessProductImage
  const factory BusinessAddProductState.addBusinessProductImageLoading() =
      AddBusinessProductImageLoading;

  const factory BusinessAddProductState.addBusinessProductImageSuccess(BusinessAddProductImagesResponse images) =
      AddBusinessProductImageSuccess;

  const factory BusinessAddProductState.addBusinessProductImageFailure(
      String error) = AddBusinessProductImageFailure;

  ///UploadBusinessImage
  const factory BusinessAddProductState.uploadBusinessImageLoading() =
      UploadBusinessImageLoading;

  const factory BusinessAddProductState.uploadBusinessImageSuccess( ) = UploadBusinessImageSuccess;

  const factory BusinessAddProductState.uploadBusinessImageFailure(
      String error) = UploadBusinessImageFailure;

  ///select image
  const factory BusinessAddProductState.selectImageSuccess(List<File> images) = SelectImageSuccess;
  const factory BusinessAddProductState.selectImageFailure(String message) = SelectImageFailure;
}
