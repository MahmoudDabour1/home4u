import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/widgets/business_header_widget.dart';
import '../../../../locale/app_locale.dart';

class ProductsHeaderWidget extends StatelessWidget {
  const ProductsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: Builder(
        builder: (context) => BusinessHeaderWidget(
          headerTitle: AppLocale.products.getString(context),
          headerIcon: AppAssets.productWhiteSvg,
        ),
      ),
    );
  }
}
