import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class FilterAvailabilitySection extends StatefulWidget {
  const FilterAvailabilitySection({super.key});

  @override
  State<FilterAvailabilitySection> createState() =>
      _FilterAvailabilitySectionState();
}

class _FilterAvailabilitySectionState extends State<FilterAvailabilitySection> {
 late bool isAvailable ;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<ProductsCubit>();

    isAvailable = cubit.isAvailable ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ProductsCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocale.availability.getString(context),
          style: AppStyles.font24BlackMedium,
        ),
        AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: Switch(
            value: cubit.isAvailable ?? false,
            onChanged: (value) {
              setState(() {
                isAvailable = !isAvailable;
                isAvailable = value;
                cubit.isAvailable = isAvailable;
              });
            },
            activeColor: AppColors.whiteColor,
            activeTrackColor: AppColors.primaryColor,
            overlayColor: WidgetStateProperty.resolveWith(
                (states) => AppColors.whiteColor),
          ),
        ),
      ],
    );
  }
}
