
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/ask_technical_worker/data/models/ask_technical_ikp_response_model.dart';

import '../data/models/ask_technical_images_response_model.dart';

part 'ask_technical_state.freezed.dart';
@freezed
class AskTechnicalState<T> with _$AskTechnicalState<T> {
  const factory AskTechnicalState.initial() = AskTechnicalInitial;

  const factory AskTechnicalState.loading() = AskTechnicalLoading;

  const factory AskTechnicalState.success(T data) = AskTechnicalSuccess<T>;

  const factory AskTechnicalState.error({required String error}) = AskTechnicalError;

  const factory AskTechnicalState.getTechnicalIkpLoading() = GetTechnicalIkpLoading;

  const factory AskTechnicalState.getTechnicalIkpSuccess(AskTechnicalIkpResponseModel askTechnicalIkpResponseModel ) = GetTechnicalIkpSuccess<T>;

  const factory AskTechnicalState.getTechnicalIkpError({required String error}) = GetTechnicalIkpError;

  const factory AskTechnicalState.askTechnicalAddingImages(List<File> images) = AskTechnicalAddingImages;

  // added Ask Technical image
  const factory AskTechnicalState.addAskTechnicalImageLoading() = AddAskTechnicalImageLoading;
  const factory AskTechnicalState.addAskTechnicalImageSuccess(AskTechnicalImageResponseModel images) = AddAskTechnicalImageSuccess;
  const factory AskTechnicalState.addAskTechnicalImageError({required String error}) = AddAskTechnicalImageError;


  //upload ask Technical image
  const factory AskTechnicalState.uploadAskTechnicalImageLoading() = UploadAskTechnicalImageLoading;
  const factory AskTechnicalState.uploadAskTechnicalImageSuccess() = UploadAskTechnicalImageSuccess<T>;
  const factory AskTechnicalState.uploadAskTechnicalImageError({required String error}) = UploadAskTechnicalImageError;
}

