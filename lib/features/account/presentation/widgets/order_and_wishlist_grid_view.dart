import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/utils/spacing.dart';

class OrderAndWishlistGridView extends StatelessWidget {
  const OrderAndWishlistGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 2,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 1 / 0.5,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (index == 0) {
              context.pushNamed(Routes.ordersScreen);
            } else {
              context.pushNamed(Routes.userFavoriteScreen);
            }
          },
          child: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grayColor.withOpacity(0.2),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Image.asset(
                      index == 0
                          ? "assets/images/checklist_icon.png"
                          : "assets/images/wishlist_icon.png",
                     height: 35.h,
                      width: 35.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  horizontalSpace(8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        index == 0 ? "Orders" : "Wishlist",
                        style: AppStyles.font16BlackMedium,
                      ),
                      verticalSpace(6),
                      Text(
                        index == 0 ? "Manage & track" : "Saved item",
                        style: AppStyles.font16GrayLight,
                      ),
                    ],
                  )
                ],
              )),
        );
      },
    );
  }
}
