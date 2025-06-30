import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/shared_pref_keys.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: Row(
                children: [
                  Image.asset(
                    "assets/images/logout_icon.png",
                    height: 35.h,
                    width: 35.w,
                  ),
                  horizontalSpace(8),
                  Text('Do you want to sign out?'),
                ],
              ),
              // content: Text('dialogBody'),
              actions: <Widget>[
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    onPressed: () {
                      SharedPrefHelper.removeData(SharedPrefKeys.userToken);
                      context.pushNamed(Routes.loginScreen);
                    },
                    child: Text(
                      "Logout",
                      style: AppStyles.font14BlackMedium.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.grayColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      "cancel",
                      style: AppStyles.font14BlackMedium,
                    )),
              ],
            );
          },
        );
      },
      child: Container(
        height: 70.h,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logout_icon.png",
                width: 35.w,
                height: 35.h,
                fit: BoxFit.cover,
              ),
              horizontalSpace(16),
              Text(
                'Sign Out',
                style: AppStyles.font20BlackMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
