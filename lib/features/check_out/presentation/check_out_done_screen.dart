import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/check_out/presentation/widgets/check_out_widgets/location_and_done_shape.dart';
import 'package:home4u/features/check_out/presentation/widgets/check_out_widgets/order_completed_text_and_image_widget.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/widgets/app_back_button.dart';
import '../../../core/widgets/app_custom_button.dart';

class CheckOutDoneScreen extends StatelessWidget {
  const CheckOutDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: AppBackButton(),
        leadingWidth: 100.w,
        title: Text(
          "Check out",
          style: AppStyles.font20BlackMedium,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LocationAndDoneShape(),
                OrderCompletedTextAndImageWidget(),
                AppCustomButton(
                  onPressed: () {},
                  textButton: AppLocale.continueShopping.getString(context),
                  btnWidth: MediaQuery.sizeOf(context).width,
                  btnHeight: 50.h,
                ),
                verticalSpace(32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
