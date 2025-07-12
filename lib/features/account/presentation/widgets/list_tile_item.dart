import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/theming/app_styles.dart';

class ListTileItem extends StatelessWidget {
  final String title;
  final Widget? titleDetails;
  final IconData? leadingIcon;
  final VoidCallback? onTap;
  final bool? isLastItem;
  final bool? isHaveTitleDetails;
  final String? imageUrl;

  const ListTileItem({
    super.key,
    required this.title,
    this.leadingIcon,
    this.imageUrl,
    this.onTap,
    this.isLastItem = false,
    this.isHaveTitleDetails = false,
    this.titleDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 4.h),
      child: Column(
        children: [
          ListTile(

            leading: Image.asset(
              imageUrl ?? "assets/images/country_icon.png",
            height: 25.h  ,
            width: 25.w,
            ),
            title: isHaveTitleDetails == true
                ? Row(
                    children: [
                      Text(
                        title,
                        style: AppStyles.font16BlackMedium,
                      ),
                      Spacer(),
                      titleDetails ?? SizedBox.shrink(),
                    ],
                  )
                : Text(
                    title,
                    style: AppStyles.font16BlackMedium,
                  ),
            trailing: Icon(Icons.arrow_forward_ios,
                size: 20.r, color: AppColors.grayColor),
            onTap: onTap,
          ),
          isLastItem == true
              ? SizedBox.shrink()
              : Divider(
                  color: AppColors.grayColor,
                ),
        ],
      ),
    );
  }
}
