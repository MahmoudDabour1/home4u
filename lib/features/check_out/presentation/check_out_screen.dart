import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/app_back_button.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';
import 'package:home4u/features/check_out/presentation/widgets/check_out_upper_widget.dart';
import 'package:home4u/features/check_out/presentation/widgets/delivery_home_container.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Check out",
          style: AppStyles.font16BlackBold,
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppBackButton(),
        ),
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CheckOutUpperWidget(),
                Text(
                  "Shipping method",
                  style: AppStyles.font16BlackBold,
                ),
                verticalSpace(8),
                DeliveryHomeContainer(),
                verticalSpace(16),
                AppCustomButton(
                  textButton: "Continue to payment",
                  btnWidth: MediaQuery.sizeOf(context).width,
                  btnHeight: 50.h,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
