import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../locale/app_locale.dart';
import '../../../logic/projects_filter/projects_filter_cubit.dart';

class ProjectFilterDurationSection extends StatelessWidget {
  const ProjectFilterDurationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProjectsFilterCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocale.durationPerMonth.getString(context),
          style: AppStyles.font20BlackMedium,
        ),
        verticalSpace(16),
        Row(
          children: [
            Expanded(
              child: AppTextFormField(
                labelText: AppLocale.min.getString(context),
                maxLines: 1,
                validator: (value) {},
                controller: cubit.minDurationController,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Icon(Icons.arrow_right_alt),
            ),
            Expanded(
              child: AppTextFormField(
                labelText: AppLocale.max.getString(context),
                validator: (value) {},
                controller: cubit.maxDurationController,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  cubit.selectedRequiredDurationFrom =
                      int.tryParse(cubit.minDurationController!.text) ?? 0;
                  cubit.selectedRequiredDurationTo =
                      int.tryParse(cubit.maxDurationController!.text) ?? 0;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
