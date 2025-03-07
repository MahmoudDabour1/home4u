import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class FilterAvailabilitySection extends StatefulWidget {
  const FilterAvailabilitySection({super.key});

  @override
  State<FilterAvailabilitySection> createState() => _FilterAvailabilitySectionState();
}

class _FilterAvailabilitySectionState extends State<FilterAvailabilitySection> {
  bool isAvailable = true;
  @override
  Widget build(BuildContext context) {

    return     Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocale.availability.getString(context),
          style: AppStyles.font24BlackMedium,
        ),
        AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: Switch(
            value: isAvailable,
            onChanged: (value) {
              setState(() {
                //change state
                isAvailable = !isAvailable;
                isAvailable = value;

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
