import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/helpers/shared_pref_helper.dart';
import 'package:home4u/core/helpers/shared_pref_keys.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_search_text_field.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({super.key});

  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {
  String _location = "Cairo, Egypt";
  fetchLocation() async {
    final location = await SharedPrefHelper.getString(SharedPrefKeys.userLocation);
    setState(() {
      _location = location ?? "Cairo, Egypt";
    });
  }
  @override
  void initState() {
    super.initState();
    fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    // final location = SharedPrefHelper.getString(SharedPrefKeys.userLocation);
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16.w),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                AppAssets.appIcon,
                width: 100.w,
                height: 60.h,
              ),
              horizontalSpace(8),
              Expanded(
                child: SizedBox(
                  height: 40.h,
                  child: AppCustomSearchTextField(
                    borderRadius: 10.r,
                    isHasBorder: true,
                    hintText: AppLocale.whatAreYouLookingFor.getString(context),
                    hintStyle: AppStyles.font14BlackLight,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications_none_outlined,
                  size: 30.r,
                ),
                onPressed: () {
                  context.pushNamed(Routes.ordersScreen);
                },
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.location_on_rounded,
                size: 20.r,
                color: AppColors.darkGrayColor,
              ),
              horizontalSpace(8),
              Text(
                AppLocale.deliverTo.getString(context),
                style: AppStyles.font16GrayLight,
              ),
              horizontalSpace(6),
              Text(
                _location ?? "Cairo, Egypt",
                style: AppStyles.font14BlackMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
