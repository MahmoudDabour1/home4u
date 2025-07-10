import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/ask_engineer/data/models/ask_engineer_ikp_response_model.dart';
import 'package:home4u/features/ask_engineer/data/models/ask_engineer_images_response_model.dart';

part 'ask_engineer_state.freezed.dart';
@freezed
class AskEngineerState<T> with _$AskEngineerState<T> {
  const factory AskEngineerState.initial() = AskEngineerInitial;

  const factory AskEngineerState.loading() = AskEngineerLoading;

  const factory AskEngineerState.success(T data) = AskEngineerSuccess<T>;

  const factory AskEngineerState.error({required String error}) = AskEngineerError;
//get Engineer ikp
  const factory AskEngineerState.getEngineerIkpLoading() = GetEngineerIkpLoading;
  const factory AskEngineerState.getEngineerIkpSuccess(AskEngineerIkpResponseModel askEngineerIkpResponseModel) = GetEngineerIkpSuccess<T>;
  const factory AskEngineerState.getEngineerIkpError({required String error}) = GetEngineerIkpError;
//add images
  const factory AskEngineerState.askEngineerAddingImages(List<File> images) = AskEngineerAddingImages;

// added Ask engineer image
  const factory AskEngineerState.addAskEngineerImageLoading() = AddAskEngineerImageLoading;
  const factory AskEngineerState.addAskEngineerImageSuccess(AskEngineerImagesResponseModel images) = AddAskEngineerImageSuccess;
  const factory AskEngineerState.addAskEngineerImageError({required String error}) = AddAskEngineerImageError;

  //upload ask engineer image
  const factory AskEngineerState.uploadAskEngineerImageLoading() = UploadAskEngineerImageLoading;
  const factory AskEngineerState.uploadAskEngineerImageSuccess() = UploadAskEngineerImageSuccess<T>;
  const factory AskEngineerState.uploadAskEngineerImageError({required String error}) = UploadAskEngineerImageError;
}


