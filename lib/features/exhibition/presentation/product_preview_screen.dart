import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/features/exhibition/presentation/widgets/product_preview/product_images_preview_widget.dart';
import 'package:home4u/features/exhibition/presentation/widgets/product_preview/product_preview_header_widget.dart';

import '../../../core/theming/app_styles.dart';
import '../../../core/utils/spacing.dart';
import '../../../locale/app_locale.dart';

class ProductPreviewScreen extends StatelessWidget {
  const ProductPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductPreviewHeader(),
            verticalSpace(32),
            ProductImagesPreviewWidget(),
          ],
        ),
      ),
    ),);
  }
}
