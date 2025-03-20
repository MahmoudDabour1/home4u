import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/routing/router_observer.dart';
import 'package:home4u/features/exhibition/logic/business_add_product_cubit.dart';
import 'package:home4u/features/exhibition/presentation/widgets/add_product/add_product_info_stepper.dart';
import 'package:home4u/features/products/data/models/product_preview_response.dart';

import '../../../core/theming/app_assets.dart';
import '../../../core/widgets/business_header_widget.dart';
import '../../../locale/app_locale.dart';
import '../../products/presentation/widgets/drawer/products_drawer.dart';

class BusinessAddProductScreen extends StatelessWidget {
  final ProductPreviewResponse? productData;

  const BusinessAddProductScreen({super.key, this.productData});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BusinessAddProductCubit>();
    logger.w(cubit.isUpdateData);
    return Scaffold(
      drawer: ProductsDrawer(
        selectedItem: DrawerItem.addProduct,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BusinessHeaderWidget(
              headerTitle: cubit.isUpdateData == true
                  ? AppLocale.updateProduct.getString(context)
                  : AppLocale.addProduct.getString(context),
              headerIcon: cubit.isUpdateData == true
                  ? AppAssets.editSvgImage
                  : AppAssets.addProductSvg,
            ),
            AddProductInfoStepper(productData: productData),
          ],
        ),
      ),
    );
  }
}
