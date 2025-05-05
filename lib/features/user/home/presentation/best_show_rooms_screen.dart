import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/user/home/presentation/widgets/scroll_container_widget.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_custom_filter_button.dart';
import '../../../../core/widgets/app_custom_search_text_field.dart';
import '../../../../locale/app_locale.dart';

class BestShowRoomsScreen extends StatelessWidget {
  const BestShowRoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(32),
                Row(
                  spacing: 16.w,
                  children: [
                    Expanded(
                      child: AppCustomSearchTextField(
                        fillColor: AppColors.offWhiteColor,
                      ),
                    ),
                    AppCustomFilterButton(
                      onPressed: () {},
                      backgroundColor: AppColors.offWhiteColor,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.h),
                  child: Text(
                    AppLocale.theBestShowrooms.getString(context),
                    style: AppStyles.font16BlackMedium,
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ScrollContainerWidget(
                      image: "assets/images/profile_back_image.png",
                      title: "Vision Office",
                      starCount: "4.5",
                    );
                  },
                  separatorBuilder: (context, index) => verticalSpace(16),
                  itemCount: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
