import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/account/presentation/widgets/logout_widget.dart';
import 'package:home4u/features/account/presentation/widgets/my_account_section.dart';
import 'package:home4u/features/account/presentation/widgets/order_and_wishlist_grid_view.dart';
import 'package:home4u/features/account/presentation/widgets/setting_section.dart';
import 'package:home4u/features/account/presentation/widgets/user_data_section.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lighterBlueColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w,
            vertical: 16.h
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserDataSection(),
                verticalSpace(16),
                OrderAndWishlistGridView(),
                MyAccountSection(),
                SettingSection(),
                LogoutWidget(),
                verticalSpace(32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
