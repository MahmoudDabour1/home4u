import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home4u/core/networking/dio_factory.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/routing/router_observer.dart';
import '../data/models/business_add_product_body.dart';
import '../data/models/business_add_product_images_body.dart';
import '../data/repository/business_add_product_repository.dart';
import 'business_add_product_state.dart';

class BusinessAddProductCubit extends Cubit<BusinessAddProductState> {
  final BusinessAddProductRepository _businessAddProductRepository;

  BusinessAddProductCubit(this._businessAddProductRepository)
      : super(const BusinessAddProductState.initial());

  /// General
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Basic Details Controllers
  final productNameArController = TextEditingController(text: "عنوان المنتج");
  final productNameEnController = TextEditingController(text: "Product Title");
  final productDescriptionArController =
      TextEditingController(text: "وصف المنتج");
  final productDescriptionEnController =
      TextEditingController(text: "Product Description");
  final productPriceController = TextEditingController(text: "20.0");
  int? selectedBaseUnit;
  int? selectedExhibitionBusinessType;

  /// Materials and Specs Controllers
  List<int>? selectedMaterials;
  final productLengthController = TextEditingController(text: "10.0");
  final productWidthController = TextEditingController(text: "10.0");
  final productHeightController = TextEditingController(text: "10.0");

  /// Colors and Stock Controllers
  final productStockAmountController = TextEditingController();
  int? selectedColor;

  /// Stores the selected colors and stock amounts
  final List<Map<String, dynamic>> selectedColorsAndStock = [];

  /// Method to update colors and stock
  void updateSelectedColorsAndStock(List<Map<String, dynamic>> newList) {
    selectedColorsAndStock.clear();
    selectedColorsAndStock.addAll(newList);
  }

  /// Images
  List<File> images = [];

  /// Select Image
  void selectImage({required BuildContext context, ImageSource? source}) {
    ImagePicker.platform
        .getImageFromSource(
      source: source!,
    )
        .then((value) {
      if (value != null) {
        final imageFile = File(value.path);
        log("Selected image path: ${imageFile.path}"); // Debug log
        images.add(imageFile);
        emit(BusinessAddProductState.selectImageSuccess(images));
        Navigator.pop(context);
      } else {
        emit(BusinessAddProductState.selectImageFailure(
            "An error occurred while selecting image"));
      }
    });
  }

  Future<void> addProductAndImages() async {
    /// Step 1: Add Product
    emit(const BusinessAddProductState.addBusinessProductLoading());

    final List<Stock> stockList = selectedColorsAndStock.map((item) {
      return Stock(
        color: BaseUnit(id: item["colorId"]),
        amount: item["stock"],
      );
    }).toList();

    logger.t("Selected Materials: $selectedMaterials");

    final addProductResult =
        await _businessAddProductRepository.addBusinessProduct(
      BusinessAddProductBody(
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
        materials:
            selectedMaterials?.map((e) => BaseUnit(id: e)).toList() ?? [],
        stocks: stockList,
        imagePaths: [],
      ),
    );

    addProductResult.when(
      success: (productResponse) async {
        emit(
            BusinessAddProductState.addBusinessProductSuccess(productResponse));

        /// Step 2: Add Product Images
        emit(const BusinessAddProductState.addBusinessProductImageLoading());

        // Prepare a list of BusinessAddProductImagesBody
        final List<BusinessAddProductImagesBody> imageBodies =
            images.map((imageFile) {
          return BusinessAddProductImagesBody(
            productId: productResponse.data.id,
            imagePath: null, // Use the image file path if needed
          );
        }).toList();

        // Send the list of images
        final addImageResult = await _businessAddProductRepository
            .addBusinessProductImage(imageBodies);

        addImageResult.when(
          success: (imageResponse) async {
            logger
                .e('Image uploaded successfully: ${imageResponse.toString()}');
            emit(BusinessAddProductState.addBusinessProductImageSuccess(
                imageResponse));

            ///ToDo
            /// Step 3: Upload Images
            emit(const BusinessAddProductState.uploadBusinessImageLoading());

            DioFactory.setContentTypeForMultipart();

            final imageFiles = await Future.wait(images.map((image) async {
              return await MultipartFile.fromFile(
                image.path,
                filename: image.path.split('/').last,
                contentType: MediaType('image', 'jpeg'),
              );
            }));

            for (var i = 0; i < imageFiles.length; i++) {
              final imageFile = imageFiles[i];
              final imageId = imageResponse.data[i].id;

              final uploadResult =
                  await _businessAddProductRepository.uploadBusinessImage(
                "BUSINESS_PRODUCTS",
                imageId,
                FormData.fromMap({
                  'file': imageFile,
                }),
              );

              uploadResult.when(
                success: (uploadResponse) {
                  logger.w(
                      'Image uploaded successfully: ${uploadResponse.toString()}'); // Debug log
                  if (uploadResponse.success) {
                    emit(BusinessAddProductState.uploadBusinessImageSuccess());
                  } else {
                    emit(BusinessAddProductState.uploadBusinessImageFailure(
                        uploadResponse.data.toString()));
                  }
                },
                failure: (error) {
                  logger
                      .d('Image upload failed: ${error.message}'); // Debug log

                  emit(BusinessAddProductState.uploadBusinessImageFailure(
                      error.message.toString()));
                },
              );
            }
          },
          failure: (error) {
            logger.e('Image upload failed: ${error.message}');
            emit(BusinessAddProductState.addBusinessProductImageFailure(
                error.message.toString()));
          },
        );
      },
      failure: (error) {
        emit(BusinessAddProductState.addBusinessProductFailure(
            error.message.toString()));
      },
    );
  }

  ///Preview
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
