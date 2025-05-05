import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/core/widgets/app_back_button.dart';
import 'package:home4u/core/widgets/app_text_form_field.dart';
import 'package:home4u/features/cart/presentation/widgets/order_details_widgets/order_details_item.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../core/theming/app_colors.dart' show AppColors;

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: 32.0.h,
              left: 24.w,
              right: 24.w,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppBackButton(),
                    Spacer(),
                    Text(
                      AppLocale.myCart.getString(context),
                      style: AppStyles.font20BlackMedium,
                    ),
                    Spacer(),
                  ],
                ),
                verticalSpace(32),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.65,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => OrderDetailsItem(),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemCount: 10,
                  ),
                ),
                verticalSpace(32.h),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: AppTextFormField(
                        labelText: "Enter your promo code",
                        validator: (p0) {},
                      ),
                    ),
                    horizontalSpace(16.w),
                    Expanded(
                      child: Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16).r,
                          gradient: LinearGradient(
                            colors: [
                              AppColors.secondaryGradientColor,
                              AppColors.secondaryColor,
                            ],
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            fixedSize:
                                WidgetStateProperty.all<Size>(Size(50.w, 50.h)),
                            backgroundColor:
                                WidgetStateProperty.all(Colors.transparent),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16).r),
                            ),
                          ),
                          icon: SvgPicture.asset(
                            AppAssets.arrowRightBlackSvg,
                            width: 28.w,
                            height: 28.h,
                            colorFilter: const ColorFilter.mode(
                                AppColors.whiteColor, BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(16.h),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        AppLocale.total.getString(context),
                        style: AppStyles.font16BlackLight,
                      ),
                    ),
                    Text(
                      "\$ 100.00",
                      style: AppStyles.font20BlackMedium,
                    ),
                  ],
                ),
                verticalSpace(32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
