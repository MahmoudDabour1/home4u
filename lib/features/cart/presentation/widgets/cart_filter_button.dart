import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_filter/cart_filter_drop_down_buttons.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_custom_filter_button.dart';
import '../../../products/presentation/widgets/filter/filter_drob_down_menu_buttons.dart';
import '../../../products/presentation/widgets/filter/filter_header_widget.dart';
import '../../../products/presentation/widgets/filter/filter_price_section.dart';

class CartFilterButton extends StatelessWidget {
  const CartFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCustomFilterButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.6,
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(16.0), // Use const here
                      decoration: BoxDecoration(
                        color: AppColors.scaffoldBusinessBackgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            verticalSpace(8),
                            const FilterHeaderWidget(), // Use const here
                            CartFilterDropDownButtons(),
                            // FilterDropDownMenuButtons(),
                            // FilterPriceSection(),
                            // FilterRatingSection(),
                            // FilterAvailabilitySection(),
                            // FilterButtons(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );;
  }
}
