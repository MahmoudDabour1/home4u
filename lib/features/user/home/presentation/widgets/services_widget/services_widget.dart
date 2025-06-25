import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/features/user/home/presentation/widgets/services_widget/services_grid_view.dart';

import '../../../../../../core/utils/spacing.dart';
import '../../../../../../locale/app_locale.dart';
import '../custom_see_all_row_widget.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocale.services.getString(context),
            style: AppStyles.font16BlackBold,
          ),
          verticalSpace(16),
          ServicesGridView(),
        ],
      ),
    );
  }
}
