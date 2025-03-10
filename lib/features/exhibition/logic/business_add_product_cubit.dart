import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home4u/core/networking/dio_factory.dart';
import 'package:home4u/features/exhibition/data/models/business_add_product_images_response.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../data/models/business_add_product_body.dart';
import '../data/models/business_add_product_images_body.dart';
import '../data/repository/business_add_product_repository.dart';
import 'business_add_product_state.dart';

class BusinessAddProductCubit extends Cubit<BusinessAddProductState> {
  final BusinessAddProductRepository _repository;

  BusinessAddProductCubit(this._repository)
      : super(const BusinessAddProductState.initial());

  /// Form Key
  final formKey = GlobalKey<FormState>();

  /// Controllers
  final productNameArController = TextEditingController(text: "عنوان المنتج");
  final productNameEnController = TextEditingController(text: "Product Title");
  final productDescriptionArController =
      TextEditingController(text: "وصف المنتج");
  final productDescriptionEnController =
      TextEditingController(text: "Product Description");
  final productPriceController = TextEditingController(text: "20.0");
  final productLengthController = TextEditingController(text: "10.0");
  final productWidthController = TextEditingController(text: "10.0");
  final productHeightController = TextEditingController(text: "10.0");
  final productStockAmountController = TextEditingController();

  /// Dropdown Selections
  int? selectedBaseUnit;
  int? selectedExhibitionBusinessType;
  List<int>? selectedMaterials;
  int? selectedColor;
  final List<Map<String, dynamic>> selectedColorsAndStock = [];

  /// Images
  final List<File> images = [];

  void updateSelectedColorsAndStock(List<Map<String, dynamic>> newList) {
    selectedColorsAndStock
      ..clear()
      ..addAll(newList);
  }

  void selectImage(
      {required BuildContext context, required ImageSource source}) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      log("Selected image path: ${imageFile.path}");
      images.add(imageFile);
      emit(BusinessAddProductState.selectImageSuccess(images));
    } else {
      emit(
          BusinessAddProductState.selectImageFailure("Image selection failed"));
    }
    Navigator.pop(context);
  }

  ///Step 1: Add Business Product
  Future<void> addProductAndImages() async {
    emit(const BusinessAddProductState.addBusinessProductLoading());

    final stockList = selectedColorsAndStock
        .map((item) => Stock(
              color: BaseUnit(id: item["colorId"]),
              amount: item["stock"],
            ))
        .toList();

    final productBody = BusinessAddProductBody(
      nameAr: productNameArController.text,
      nameEn: productNameEnController.text,
      descriptionAr: productDescriptionArController.text,
      descriptionEn: productDescriptionEnController.text,
      businessType: BaseUnit(id: selectedExhibitionBusinessType!),
      price: double.parse(productPriceController.text),
      length: double.parse(productLengthController.text),
      width: double.parse(productWidthController.text),
      height: double.parse(productHeightController.text),
      baseUnit: BaseUnit(id: selectedBaseUnit!),
      materials: selectedMaterials?.map((e) => BaseUnit(id: e)).toList() ?? [],
      stocks: stockList,
      imagePaths: [],
    );

    final addProductResult = await _repository.addBusinessProduct(productBody);
    addProductResult.when(
      success: (productResponse) async {
        emit(
            BusinessAddProductState.addBusinessProductSuccess(productResponse));
        await _addBusinessProductImages(productResponse.data.id);
      },
      failure: (error) => emit(
          BusinessAddProductState.addBusinessProductFailure(
              error.message.toString())),
    );
  }

  ///Step 2: Add Business Product Images
  Future<void> _addBusinessProductImages(int productId) async {
    emit(const BusinessAddProductState.addBusinessProductImageLoading());

    final imageBodies = images
        .map((image) => BusinessAddProductImagesBody(
              productId: productId,
              imagePath: null,
            ))
        .toList();

    final addImageResult =
        await _repository.addBusinessProductImage(imageBodies);
    addImageResult.when(
      success: (imageResponse) async {
        emit(BusinessAddProductState.addBusinessProductImageSuccess(
            imageResponse));
        await _uploadBusinessImages(imageResponse);
      },
      failure: (error) => emit(
          BusinessAddProductState.addBusinessProductImageFailure(
              error.message.toString())),
    );
  }

  ///Step 3: Upload Business Images
  Future<void> _uploadBusinessImages(
      BusinessAddProductImagesResponse imageResponse) async {
    emit(const BusinessAddProductState.uploadBusinessImageLoading());
    DioFactory.setContentTypeForMultipart();

    final imageFiles =
        await Future.wait(images.map((image) => MultipartFile.fromFile(
              image.path,
              filename: image.path.split('/').last,
              contentType: MediaType('image', 'jpeg'),
            )));

    for (var i = 0; i < imageFiles.length; i++) {
      final uploadResult = await _repository.uploadBusinessImage(
        "BUSINESS_PRODUCTS",
        imageResponse.data[i].id,
        FormData.fromMap({'file': imageFiles[i]}),
      );
      uploadResult.when(
        success: (uploadResponse) {
          if (uploadResponse.success) {
            emit(BusinessAddProductState.uploadBusinessImageSuccess());
          } else {
            emit(BusinessAddProductState.uploadBusinessImageFailure(
                uploadResponse.data.toString()));
          }
        },
        failure: (error) => emit(
            BusinessAddProductState.uploadBusinessImageFailure(
                error.message.toString())),
      );
    }
  }

  ///Product Preview
  Map<String, dynamic> getPreviewData() {
    return {
      'productName': productNameEnController.text,
      'productColor': selectedColor.toString(),
      'productDescription': productDescriptionEnController.text,
      'productMaterial': selectedMaterials?.join(', ') ?? '',
      'productDimensions':
          '${productLengthController.text} x ${productWidthController.text} x ${productHeightController.text}',
      'baseUnit': selectedBaseUnit.toString(),
      'productStock': productStockAmountController.text,
      'images': images,
    };
  }
}
