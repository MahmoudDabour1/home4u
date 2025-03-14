import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_custom_text_button_with_icon.dart';
import '../../../../../locale/app_locale.dart';
import '../../../logic/business_add_product_cubit.dart';
import '../../../logic/business_add_product_state.dart';
import '../add_product/success_mission_dialog.dart';

class ProductSubmitButton extends StatelessWidget {
  const ProductSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessAddProductCubit, BusinessAddProductState>(
      builder: (context, state) {
        return BlocConsumer<BusinessAddProductCubit, BusinessAddProductState>(
          listener: (context, state) {
            state.maybeWhen(
              addBusinessProductFailure: (message) {
                log('Product failure because $message');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Product  failure because $message'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              addBusinessProductSuccess: (_) {
                showAdaptiveDialog(context: context, builder:
                    (context) => SuccessMissionDialog()
                  ,);
              },
              orElse: () {},
            );
          },

          builder: (context, state) {
            return AppCustomTextButtonWithIcon(
              onPressed: () {
                final cubit = context.read<BusinessAddProductCubit>();
                log("Selected Business Type: ${cubit
                    .selectedExhibitionBusinessType}");
                log("Selected Base Unit: ${cubit.selectedBaseUnit}");

                if (cubit.selectedExhibitionBusinessType == null ||
                    cubit.selectedBaseUnit == null) {
                  _showSnackBar(context);
                  return;
                }

                cubit.addOrUpdateProduct();
              },
              isWhiteLoading: false,
              svgIcon: AppAssets.submitIconSvg,
              text: AppLocale.submit.getString(context),
              isLoading: state is AddBusinessProductLoading,
              textStyle: AppStyles.font16DarkBlueBold,
              backgroundColor: AppColors.whiteColor,
              svgIconColor: AppColors.secondaryColor,
              useGradient: false,
            );
          },
        );
      },
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            "Please select a business type and base unit."),
        backgroundColor: Colors.red,
      ),
    );
  }
}
