import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:home4u/features/exhibition/presentation/widgets/add_product/up_down_form_field.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/get_common_input_decoration.dart';
import '../../../../../locale/app_locale.dart';
import '../../../../products/data/models/products_response_model.dart';
import '../../../logic/business_add_product_cubit.dart';
import 'basic_details_drop_down_buttons.dart';

class AddProductBasicDetailsStepper extends StatefulWidget {
  final int? productIndex;

  const AddProductBasicDetailsStepper({
    super.key,
     this.productIndex,
  });

  @override
  State<AddProductBasicDetailsStepper> createState() =>
      _AddProductBasicDetailsStepperState();
}

class _AddProductBasicDetailsStepperState
    extends State<AddProductBasicDetailsStepper> {
  late FocusNode productNameAr;
  late FocusNode productNameEn;
  late FocusNode priceFocusNode;
  ProductsResponseModel? productCachedData;

  @override
  void initState() {
    super.initState();
    productNameAr = FocusNode();
    productNameEn = FocusNode();
    priceFocusNode = FocusNode();
    _loadProductData();
  }

  @override
  void dispose() {
    productNameAr.dispose();
    productNameEn.dispose();
    priceFocusNode.dispose();
    super.dispose();
  }

  void _loadProductData() async {
    var productsBox = await Hive.openBox<ProductsResponseModel>(kProductsBox);
    var productData = productsBox.get(kProductsData);
    productCachedData = productData;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final businessCubit = context.read<BusinessAddProductCubit>();
    if (widget.productIndex != null) {
      businessCubit.productNameEnController.text =
          productCachedData?.data?.content?[widget.productIndex ?? 0].name ?? "";
      businessCubit.productNameArController.text =
          productCachedData?.data?.content?[widget.productIndex ?? 0].name ?? "";
      businessCubit.productPriceController.text =
          productCachedData?.data?.content?[widget.productIndex ?? 0].price.toString() ?? "";
      // businessCubit.productDescriptionEnController.text =
      //     productCachedData?.data?.content?[widget.productIndex ?? 0]. ?? "";
    }else{
      businessCubit.productNameEnController.clear();
      businessCubit.productNameArController.clear();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 16.h,
      children: [
        AppTextFormField(
          controller: businessCubit.productNameArController,
          labelText: AppLocale.productNameAr.getString(context),
          focusNode: productNameAr,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your product name";
            }
            return null;
          },
        ),
        AppTextFormField(
          controller: businessCubit.productNameEnController,
          labelText: AppLocale.productNameEn.getString(context),
          focusNode: productNameEn,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your product name";
            }
            return null;
          },
        ),
        BasicDetailsDropDownButtons(),
        UpDownFormField(
          controller: businessCubit.productPriceController,
          label: "${AppLocale.price.getString(context)}( £ )",
          focusNode: priceFocusNode,
          validationMessage: "Please enter your product price",
        ),
        AppTextFormField(
          labelText: AppLocale.productDescriptionAr.getString(context),
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          controller: businessCubit.productDescriptionArController,
          decoration: getCommonInputDecoration(
            labelText: AppLocale.productDescriptionAr.getString(context),
          ).copyWith(
            constraints: BoxConstraints(
              maxHeight: 100.h,
            ),
            alignLabelWithHint: true,
            isDense: true,
          ),
          maxLines: 10,
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your product description in arabic";
            }
            return null;
          },
        ),
        AppTextFormField(
          labelText: AppLocale.productDescriptionEn.getString(context),
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          controller: businessCubit.productDescriptionEnController,
          decoration: getCommonInputDecoration(
            labelText: AppLocale.productDescriptionEn.getString(context),
          ).copyWith(
            constraints: BoxConstraints(
              maxHeight: 100.h,
            ),
            alignLabelWithHint: true,
            isDense: true,
          ),
          maxLines: 10,
          validator: (value) {
            if (value.isEmpty) {
              return "Please enter your product description in english";
            }
            return null;
          },
        ),
      ],
    );
  }
}
