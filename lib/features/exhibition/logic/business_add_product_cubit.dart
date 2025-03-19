import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/networking/dio_factory.dart';
import 'package:home4u/core/routing/router_observer.dart';
import 'package:home4u/features/exhibition/data/models/add_product_business_response_model.dart';
import 'package:home4u/features/exhibition/data/models/business_add_product_images_response.dart';
import 'package:home4u/features/products/data/models/update_product_response_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../../products/data/models/product_preview_response.dart';
import '../../products/logic/products_cubit.dart';
import '../data/models/business_add_product_body.dart';
import '../data/models/business_add_product_images_body.dart';
import '../data/repository/business_add_product_repository.dart';
import 'business_add_product_state.dart';

class BusinessAddProductCubit extends Cubit<BusinessAddProductState> {
  final BusinessAddProductRepository _repository;

  BusinessAddProductCubit(this._repository)
      : super(const BusinessAddProductState.initial());

  final formKey = GlobalKey<FormState>();

  /// Controllers
  final productNameArController = TextEditingController();
  final productNameEnController = TextEditingController();
  final productDescriptionArController = TextEditingController();
  final productDescriptionEnController = TextEditingController();
  final productPriceController = TextEditingController();
  final productLengthController = TextEditingController();
  final productWidthController = TextEditingController();
  final productHeightController = TextEditingController();
  final productStockAmountController = TextEditingController();

  int? selectedBaseUnit;
  int? selectedExhibitionBusinessType;
  List<int>? selectedMaterials;
  int? selectedColor;

  bool isUpdateData = false;
  final List<Map<String, dynamic>> selectedColorsAndStock = [];

  late List<File> images = [];

  void updateSelectedColorsAndStock(List<Map<String, dynamic>> newList) {
    selectedColorsAndStock
      ..clear()
      ..addAll(newList);
    emit(BusinessAddProductState.uploadBusinessImageLoading());
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

  Future<void> addOrUpdateProduct({
    bool isUpdate = false,
    int? productId,
    ProductPreviewResponse? productData,
  }) async {
    isUpdateData = isUpdate;
    if (selectedExhibitionBusinessType == null || selectedBaseUnit == null) {
      emit(BusinessAddProductState.addBusinessProductFailure(
          "Please select a business type and base unit."));
      return;
    }
    isUpdate
        ? emit(const BusinessAddProductState.updateProductLoading())
        : emit(const BusinessAddProductState.addBusinessProductLoading());

    final productBody = _createProductBody(
      isUpdate ? productId : null,
      productData,
    );
    final result = isUpdate
        ? await _repository.updateBusinessProduct(productBody)
        : await _repository.addBusinessProduct(productBody);

    result.when(
      success: (productResponse) async {
        if (isUpdate) {
          if (productResponse is UpdateProductsResponseModel) {
            logger.w(
              selectedColorsAndStock // Use selectedColorsAndStock for new additions
                  .map((item) => Stock(
                      id: item['id'],
                      color: BaseUnit(id: item["colorId"]),
                      amount: item["stock"]))
                  .toList(),
            );
            // type check
            emit(BusinessAddProductState.updateProductSuccess(productResponse));
            await _addBusinessProductImages(productResponse.data!.id!);
          } else {
            emit(BusinessAddProductState.addBusinessProductFailure(
                "Unexpected response type for update."));
          }
        } else {
          if (productResponse is AddProductBusinessResponseModel) {
            // type check
            emit(BusinessAddProductState.addBusinessProductSuccess(
                productResponse));
            await _addBusinessProductImages(productResponse.data.id);
          } else {
            emit(BusinessAddProductState.addBusinessProductFailure(
                "Unexpected response type for add."));
          }
        }
      },
      failure: (error) => emit(
          BusinessAddProductState.addBusinessProductFailure(
              error.message.toString())),
    );
  }

  BusinessAddProductBody _createProductBody(
    int? productId,
    ProductPreviewResponse? productData,
  ) {
    final uniqueStocks = <Stock>[];
    final seen = <int>{};

    for (final item in selectedColorsAndStock) {
      final colorId = item["colorId"];
      final stockAmount = item["stock"];

      final existingStock = productData?.data.stocks.firstWhere(
        (stock) => stock.color.id == colorId,
        orElse: () => ResponseStock(
          id: null,
          color: ResponseBaseUnit(id: colorId, code: "", name: ""),
          amount: stockAmount,
          statusCode: null,
        ),
      );

      if (!seen.contains(colorId)) {
        seen.add(colorId);
        uniqueStocks.add(Stock(
          id: existingStock?.id,
          color: BaseUnit(id: colorId),
          amount: stockAmount,
        ));
      }
    }

    return BusinessAddProductBody(
      id: productId,
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
      stocks: uniqueStocks,
      imagePaths: [],
    );
  }

  Future<void> _addBusinessProductImages(int productId) async {
    emit(const BusinessAddProductState.addBusinessProductImageLoading());

    final imageBodies = images
        .map((image) =>
            BusinessAddProductImagesBody(productId: productId, imagePath: null))
        .toList();
    final result = await _repository.addBusinessProductImage(imageBodies);

    result.when(
      success: (imageResponse) async {
        emit(BusinessAddProductState.addBusinessProductImageSuccess(
            imageResponse));
        await _uploadBusinessImages(imageResponse);
      },
      failure: (error) => emit(
        BusinessAddProductState.addBusinessProductImageFailure(
          error.message.toString(),
        ),
      ),
    );
  }

  Future<void> _uploadBusinessImages(
      BusinessAddProductImagesResponse imageResponse) async {
    emit(const BusinessAddProductState.uploadBusinessImageLoading());
    DioFactory.setContentTypeForMultipart();

    final imageFiles = await Future.wait(
      images.map(
        (image) => MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
          contentType: MediaType('image', 'jpeg'),
        ),
      ),
    );

    for (var i = 0; i < imageFiles.length; i++) {
      final result = await _repository.uploadBusinessImage("BUSINESS_PRODUCTS",
          imageResponse.data[i].id, FormData.fromMap({'file': imageFiles[i]}));

      result.when(
        success: (uploadResponse) {
          if (uploadResponse.success) {
            emit(BusinessAddProductState.uploadBusinessImageSuccess());
          } else {
            emit(
              BusinessAddProductState.uploadBusinessImageFailure(
                uploadResponse.data.toString(),
              ),
            );
          }
        },
        failure: (error) => emit(
          BusinessAddProductState.uploadBusinessImageFailure(
            error.message.toString(),
          ),
        ),
      );
    }
    // DioFactory.setContentType('application/json');
  }

  Map<String, dynamic> getPreviewData(BuildContext context) {
    final productCubit = context.read<ProductsCubit>();

    final materialNames = selectedMaterials?.map((id) {
          final material = productCubit.materials.firstWhere(
            (material) => material.id == id,
          );
          return material.name ?? 'N/A';
        }).join(', ') ??
        '';

    final baseUnitName = productCubit.baseUnits
            .firstWhere(
              (unit) => unit.id == selectedBaseUnit,
            )
            .name ??
        'N/A';

    final productStockAndColors = selectedColorsAndStock.map((item) {
      final color = productCubit.colors.firstWhere(
        (element) => element.id == item["colorId"],
      );
      return {
        'hexColor': color.hexColor,
        'stock': item["stock"],
      };
    }).toList();

    return {
      'productName': productNameEnController.text,
      'productColor': selectedColor.toString(),
      'productDescription': productDescriptionEnController.text,
      'productMaterial': materialNames,
      'productDimensions':
          '${productLengthController.text} x ${productWidthController.text} x ${productHeightController.text}',
      'baseUnit': baseUnitName,
      'productStockAndColors': productStockAndColors,
      'images': images,
    };
  }
}
