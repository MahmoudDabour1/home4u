import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/exhibition/presentation/widgets/add_product/add_product_info_stepper.dart';
import 'package:home4u/features/exhibition/presentation/widgets/add_product/add_product_materials_and_specs.dart';
import '../../../core/theming/app_assets.dart';
import '../../../core/utils/spacing.dart';
import '../../../core/widgets/business_header_widget.dart';
import '../../../locale/app_locale.dart';
import '../../../core/widgets/app_custom_button.dart';

class BusinessAddProductScreen extends StatelessWidget {
  const BusinessAddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BusinessHeaderWidget(
              headerTitle: AppLocale.addProduct.getString(context),
              headerIcon: AppAssets.addProductSvg,
              menuOnPressed: () {},
            ),
            AddProductInfoStepper(),
          ],
        ),
      ),
    );
  }
}
