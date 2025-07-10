import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/widgets/app_custom_button.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../locale/app_locale.dart';
import '../../../logic/products_cubit.dart';

class FilterHeaderWidget extends StatefulWidget {
  final VoidCallback? onClearPressed;

  const FilterHeaderWidget({super.key, this.onClearPressed});

  @override
  State<FilterHeaderWidget> createState() => _FilterHeaderWidgetState();
}

class _FilterHeaderWidgetState extends State<FilterHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              AppAssets.filterSvg,
              alignment: Alignment.center,
              width: 24.w,
              height: 24.h,
            ),
            horizontalSpace(6),
            Text(
              AppLocale.filter.getString(context),
              style: AppStyles.font24BlackMedium,
            ),
          ],
        ),

        Row(
          spacing: 8,
          children: [
            AppCustomButton(textButton: AppLocale.clear.getString(context),
                btnWidth: 80.w,
                btnHeight: 30.h,
                onPressed:widget.onClearPressed ?? (){
                  cubit.resetFilters();
                  cubit.getProducts(isRefresh: true);
                  Navigator.pop(context);

                }),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(
                  Icons.close,
                  size: 24.r,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
