import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';

import '../../../../../../core/utils/spacing.dart';
import '../../../../../../locale/app_locale.dart';
import '../custom_see_all_row_widget.dart';
import 'best_office_list_view.dart';

class BestOfficeWidget extends StatelessWidget {
  const BestOfficeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child : Column(
      children: [
        verticalSpace(32),
        CustomSeeAllRowWidget(
          text: AppLocale.theBestOffices.getString(context),
          onPressed: () {
            context.pushNamed(Routes.bestOfficesScreen);
          },
        ),
        verticalSpace(16),
        BestOfficeListView(),
      ],
    ),);
  }
}
