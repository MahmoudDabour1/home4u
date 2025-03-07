import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/exhibition/presentation/widgets/add_product/up_down_form_field.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/get_common_input_decoration.dart';
import '../../../../../locale/app_locale.dart';

class AddProductBasicDetailsStepper extends StatefulWidget {
  const AddProductBasicDetailsStepper({super.key});

  @override
  State<AddProductBasicDetailsStepper> createState() =>
      _AddProductBasicDetailsStepperState();
}

class _AddProductBasicDetailsStepperState
    extends State<AddProductBasicDetailsStepper> {
  late FocusNode productNameAr;
  late FocusNode productNameEn;
  late FocusNode priceFocusNode;
  final double _quantity = 0.0;
  String? selectedBusinessType;
  List<String> businessTypes = [
    'Business Type 1',
    'Business Type 2',
    'Business Type 3',
  ];

  @override
  void initState() {
    super.initState();
    productNameAr = FocusNode();
    productNameEn = FocusNode();
    priceFocusNode = FocusNode();
  }

  @override
  void dispose() {
    productNameAr.dispose();
    productNameEn.dispose();
    priceFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 16.h,
      children: [
        AppTextFormField(
          controller: TextEditingController(),
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
          controller: TextEditingController(),
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
        UpDownFormField(
          controller: TextEditingController(text: '$_quantity'),
          label: "${AppLocale.price.getString(context)}( £ )",
          focusNode: priceFocusNode,
          validationMessage: "Please enter your product price",
        ),
        AppCustomDropDownButtonFormField(
          value: selectedBusinessType,
          items: businessTypes.map((type) {
            return DropdownMenuItem<String>(
              value: type,
              child: Text(
                type,
                style: AppStyles.font16BlackLight,
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedBusinessType = value;
            });
          },
          onSaved: (value) {},
          labelText: AppLocale.businessType.getString(context),
        ),
        AppTextFormField(
          labelText: AppLocale.productDescriptionAr.getString(context),
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          controller: TextEditingController(),
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
          controller: TextEditingController(),
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
