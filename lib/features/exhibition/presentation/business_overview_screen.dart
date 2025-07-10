import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/features/exhibition/presentation/widgets/overview/business_overview_contact_information_container.dart';
import 'package:home4u/features/exhibition/presentation/widgets/overview/business_overview_general_container.dart';
import 'package:home4u/features/exhibition/presentation/widgets/overview/business_overview_social_media_container.dart';
import 'package:home4u/features/products/presentation/widgets/drawer/products_drawer.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../core/utils/spacing.dart';
import '../../../core/widgets/business_header_widget.dart';

class BusinessOverviewScreen extends StatelessWidget {
  const BusinessOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProductsDrawer(selectedItem: DrawerItem.overview,),
      backgroundColor: AppColors.scaffoldBusinessBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            BusinessHeaderWidget(
              headerTitle: AppLocale.overview.getString(context),
              headerIcon: AppAssets.overviewIcon,
            ),
            verticalSpace(32),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24).w,
              child: Column(
                spacing: 32.h,
                children: [
                  BusinessOverviewGeneralContainer(),
                  BusinessOverviewContactInformationContainer(),
                  BusinessOverviewSocialMediaContainer(),
                ],
              ),
            ),
            verticalSpace(32),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 24).w,
              child: AppCustomButton(
                textButton: AppLocale.saveChanges.getString(context),
                btnWidth: MediaQuery.sizeOf(context).width ,
                btnHeight: 60.h,
                onPressed: () {},
              ),
            ),
            verticalSpace(64),
          ],
        ),
      ),
    );
  }
}
