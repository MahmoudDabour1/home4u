import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_custom_search_text_field.dart';
import '../../../../../locale/app_locale.dart';

class CartProductBackButtonAndSearchField extends StatelessWidget {
  const CartProductBackButtonAndSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.blackColor,
            size: 30.r,
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 45.h,
            child: AppCustomSearchTextField(
              borderRadius: 10.r,
              fillColor: AppColors.mediumGrayColor,
              hintText: AppLocale.whatAreYouLookingFor
                  .getString(context),
              hintStyle: AppStyles.font14BlackLight,
            ),
          ),
        ),
      ],
    );
  }
}
