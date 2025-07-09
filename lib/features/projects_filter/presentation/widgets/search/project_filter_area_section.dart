import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/logic/projects_filter/projects_filter_cubit.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/search/project_filter_area_range_widget.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../locale/app_locale.dart';

class ProjectFilterAreaSection extends StatefulWidget {
  const ProjectFilterAreaSection({super.key});

  @override
  State<ProjectFilterAreaSection> createState() => _ProjectFilterAreaSectionState();
}

class _ProjectFilterAreaSectionState extends State<ProjectFilterAreaSection> {


  late TextEditingController _minAreaController;
  late TextEditingController _maxAreaController;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<ProjectsFilterCubit>();

    double  minArea = cubit.selectedUnitAreaFrom ?? 1;
    double  maxArea = cubit.selectedUnitAreaTo ?? 500;

    _minAreaController = TextEditingController(text: minArea.toString());
    _maxAreaController = TextEditingController(text: maxArea.toString());
  }

  @override
  void dispose() {
    _minAreaController.dispose();
    _maxAreaController.dispose();
    super.dispose();
  }



  void _updateSlider(BuildContext context) {
    double? minArea = double.tryParse(_minAreaController.text);
    double? maxArea = double.tryParse(_maxAreaController.text);

    if (minArea != null && maxArea != null && minArea <= maxArea) {
      final cubit = context.read<ProjectsFilterCubit>();

      cubit.selectedUnitAreaFrom = minArea;
      cubit.selectedUnitAreaTo = maxArea;
      setState(() {

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProjectsFilterCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocale.area.getString(context),
          style: AppStyles.font24BlackMedium,
        ),
        verticalSpace(16),
        Row(
          children: [
            Expanded(
              child: AppTextFormField(
                labelText: AppLocale.minArea.getString(context),
                validator: (value) {},
                controller: _minAreaController,
                keyboardType: TextInputType.number,
                onChanged: (value) => _updateSlider(context),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Icon(Icons.arrow_right_alt),
            ),
            Expanded(
              child: AppTextFormField(
                labelText: AppLocale.maxArea.getString(context),
                validator: (value) {},
                controller: _maxAreaController,
                keyboardType: TextInputType.number,
                onChanged: (value) => _updateSlider(context),
              ),
            ),
          ],
        ),
        ProjectFilterAreaRangeWidget(
          minArea: cubit.selectedUnitAreaFrom?? 0,
          maxArea: cubit.selectedUnitAreaTo?? 500,
          onChanged: (values) {
            setState(() {
              _minAreaController.text = values.start.toStringAsFixed(0);
              _maxAreaController.text = values.end.toStringAsFixed(0);
            });
            cubit.selectedUnitAreaFrom = values.start;
            cubit.selectedUnitAreaTo = values.end;
          },
        ),
        verticalSpace(16),
      ],
    );
  }
}
