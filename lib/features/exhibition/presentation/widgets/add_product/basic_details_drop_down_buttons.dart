import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../auth/sign_up/logic/sign_up_cubit.dart';
import '../../../../products/logic/products_cubit.dart';
import '../../../logic/business_add_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/exhibition/presentation/widgets/add_product/up_down_form_field.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/get_common_input_decoration.dart';
import '../../../../../locale/app_locale.dart';
import '../../../logic/business_add_product_cubit.dart';


class BasicDetailsDropDownButtons extends StatefulWidget {
  const BasicDetailsDropDownButtons({super.key});

  @override
  State<BasicDetailsDropDownButtons> createState() =>
      _BasicDetailsDropDownButtonsState();
}

class _BasicDetailsDropDownButtonsState
    extends State<BasicDetailsDropDownButtons> {

  String? selectedBusinessType;
  String? selectedBaseUnit;

  @override
  void initState() {
    super.initState();
    context.read<SignUpCubit>().getBusinessTypes();
  }

  @override
  Widget build(BuildContext context) {
    final businessCubit = context.read<BusinessAddProductCubit>();
    final signUpCubit = context.read<SignUpCubit>();
    final productsCubit = context.read<ProductsCubit>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 16.h,
      children: [
        AppCustomDropDownButtonFormField(
          value: selectedBusinessType,
          items: signUpCubit.businessTypes
              .map((businessType) {
            return DropdownMenuItem<String>(
              value: businessType.id.toString(),
              child: Text(
                businessType.name,
                style: AppStyles.font16BlackLight,
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedBusinessType = value;
            });
          },
          onSaved: (value) {
            businessCubit.selectedBusinessType = int.parse(value!);
          },
          labelText: AppLocale.businessType.getString(context),
        ),
        AppCustomDropDownButtonFormField(
          value: selectedBaseUnit,
          items: productsCubit.baseUnits.
          map((material) {
            return DropdownMenuItem<String>(
              value: material.id.toString(),
              child: Text(
                material.name!,
                //TODO: check if name is nullable [could cause problem later]
                style: AppStyles.font16BlackLight,
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedBaseUnit = value;
            });
          },
          onSaved: (value) {
            businessCubit.selectedBaseUnit = int.parse(value!);
          },
          labelText: AppLocale.baseUnit.getString(context),
        ),
      ],
    );
  }
}
