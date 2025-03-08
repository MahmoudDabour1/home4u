import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../data/models/business_add_product_body.dart';
import '../data/models/business_add_product_images_body.dart';
import '../data/repository/business_add_product_repository.dart';
import 'business_add_product_state.dart';

class BusinessAddProductCubit extends Cubit<BusinessAddProductState> {
  final BusinessAddProductRepository _businessAddProductRepository;

  BusinessAddProductCubit(this._businessAddProductRepository)
      : super(const BusinessAddProductState.initial());

  ///General
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ///Basic Details Controllers
  final productNameArController = TextEditingController();
  final productNameEnController = TextEditingController();
  final productDescriptionArController = TextEditingController();
  final productDescriptionEnController = TextEditingController();
  final productPriceController = TextEditingController();
  int? selectedBaseUnit;
  int? selectedBusinessType;

  ///Materials and Specs Controllers
  List<int>? selectedMaterials;
  final productLengthController = TextEditingController();
  final productWidthController = TextEditingController();
  final productHeightController = TextEditingController();

  ///Colors and Stock Controllers
  final productStockAmountController = TextEditingController();
  int? selectedColor;

  ///Images
  List<File> images = [];

  Future<void> addBusinessProduct(
      BusinessAddProductBody businessAddProductBody) async {
    emit(const BusinessAddProductState.addBusinessProductLoading());
    final result = await _businessAddProductRepository
        .addBusinessProduct(businessAddProductBody);
    result.when(
      success: (response) {
        emit(BusinessAddProductState.addBusinessProductSuccess(response));
      },
      failure: (error) {
        emit(BusinessAddProductState.addBusinessProductFailure(
            error.message.toString()));
      },
    );
  }

  Future<void> addBusinessProductImage(
      BusinessAddProductImagesBody imagesBody) async {
    emit(const BusinessAddProductState.addBusinessProductImageLoading());
    final result =
        await _businessAddProductRepository.addBusinessProductImage(imagesBody);
    result.when(
      success: (response) {
        emit(BusinessAddProductState.addBusinessProductImageSuccess(response));
      },
      failure: (error) {
        emit(BusinessAddProductState.addBusinessProductImageFailure(
            error.message.toString()));
      },
    );
  }

  Future<void> uploadBusinessImage(
    String pathId,
    int businessTypeId,
    FormData fileData,
  ) async {
    emit(const BusinessAddProductState.uploadBusinessImageLoading());
    final result = await _businessAddProductRepository.uploadBusinessImage(
      "BUSINESS_PRODUCTS",
      businessTypeId,
      fileData,
    );
    result.when(
      success: (response) {
        emit(BusinessAddProductState.uploadBusinessImageSuccess(response));
      },
      failure: (error) {
        emit(BusinessAddProductState.uploadBusinessImageFailure(
            error.message.toString()));
      },
    );
  }
}
