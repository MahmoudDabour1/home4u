import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/exhibition/presentation/widgets/add_product/up_down_form_field.dart';

import '../../../../../core/widgets/app_custom_drop_down_multi_select_button.dart';
import '../../../../../locale/app_locale.dart';
import '../../../../products/data/models/product_preview_response.dart';
import '../../../../products/logic/products_cubit.dart';
import '../../../logic/business_add_product_cubit.dart';

class AddProductMaterialsAndSpecs extends StatefulWidget {
  final ProductPreviewResponse? productData;

  const AddProductMaterialsAndSpecs({super.key, this.productData});

  @override
  State<AddProductMaterialsAndSpecs> createState() =>
      _AddProductMaterialsAndSpecsState();
}

class _AddProductMaterialsAndSpecsState
    extends State<AddProductMaterialsAndSpecs> {
  List<String>? selectedMaterials = [];
  late FocusNode lengthFocusNode;
  late FocusNode widthFocusNode;
  late FocusNode heightFocusNode;

  @override
  void initState() {
    super.initState();
    lengthFocusNode = FocusNode();
    widthFocusNode = FocusNode();
    heightFocusNode = FocusNode();
    final productCubit = context.read<ProductsCubit>();


    if (widget.productData != null) {
      selectedMaterials = widget.productData!.data.materials
          .where((m) => m.name != null)
          .map((m) => m.name)
          .toList();
    } else {
      selectedMaterials = [];
    }
    if (productCubit.materials.isEmpty) {
      productCubit.getBusinessConfig();
    }
  }

  @override
  void dispose() {
    lengthFocusNode.dispose();
    widthFocusNode.dispose();
    heightFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productCubit = context.read<ProductsCubit>();
    final businessCubit = context.read<BusinessAddProductCubit>();
    if (widget.productData != null) {
      businessCubit.productLengthController.text =
          widget.productData?.data.length.toString() ?? "";
      businessCubit.productWidthController.text =
          widget.productData?.data.width.toString() ?? "";
      businessCubit.productHeightController.text =
          widget.productData?.data.height.toString() ?? "";
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 16.h,
      children: [
        AppCustomDropDownMultiSelectButton(
          isEnabled: true,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return "Please select at least one material";
            }
            return null;
          },
          selectedValues: selectedMaterials ?? [],
          items: productCubit.materials
              .map((material) => material.name ?? "N/A")
              .toList(),
          labelText: AppLocale.selectMaterials.getString(context),
          onChanged: (List<String> values) {
            setState(() {
              selectedMaterials = values.isNotEmpty ? values : selectedMaterials;
            });
            businessCubit.selectedMaterials = values.isNotEmpty
                ? values.map((name) {
              return productCubit.materials.firstWhere(
                    (material) => material.name == name,
              ).id;
            }).whereType<int>().toList()
                : businessCubit.selectedMaterials;

          },
          onSaved: (value) {
            businessCubit.selectedMaterials = value != null && value.isNotEmpty
                ? value.map((name) {
              return productCubit.materials.firstWhere(
                    (material) => material.name == name,
              ).id;
            }).whereType<int>().toList()
                : businessCubit.selectedMaterials;
          },

        ),
        UpDownFormField(
          label: AppLocale.dimensionLength.getString(context),
          controller: businessCubit.productLengthController,
          focusNode: lengthFocusNode,
          validationMessage: "Please enter a valid length",
        ),
        UpDownFormField(
          label: AppLocale.dimensionWidth.getString(context),
          controller: businessCubit.productWidthController,
          focusNode: widthFocusNode,
          validationMessage: "Please enter a valid width",
        ),
        UpDownFormField(
          label: AppLocale.dimensionHeight.getString(context),
          controller: businessCubit.productHeightController,
          focusNode: heightFocusNode,
          validationMessage: "Please enter a valid height",
        ),
      ],
    );
  }
}
