import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/cart/presentation/widgets/favorite_widgets/user_favorite_item.dart';

import '../../../core/theming/app_styles.dart';
import '../../../core/widgets/app_back_button.dart';
import '../../../locale/app_locale.dart';

class UserFavoriteScreen extends StatelessWidget {
  const UserFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 32.0.h,
                left: 24.w,
                right: 24.w,
              ),
              child: Column(
                spacing: 32.h,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppBackButton(),
                      Spacer(),
                      Text(
                        AppLocale.favorites.getString(context),
                        style: AppStyles.font20BlackMedium,
                      ),
                      Spacer(),
                    ],
                  ),
                  ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => UserFavoriteItem(),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemCount: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
