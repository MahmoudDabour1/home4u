import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/logic/projects_filter/projects_filter_cubit.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../locale/app_locale.dart';
import '../../../../products/presentation/widgets/filter/price_filter_range_widget.dart';

class ProjectFilterPriceSection extends StatefulWidget {
  const ProjectFilterPriceSection({super.key});

  @override
  State<ProjectFilterPriceSection> createState() => _ProjectFilterPriceSectionState();
}

class _ProjectFilterPriceSectionState extends State<ProjectFilterPriceSection> {

  late TextEditingController _minPriceController;
  late TextEditingController _maxPriceController;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<ProjectsFilterCubit>();

    double minPrice = cubit.selectedBudgetFrom ?? 100;
    double maxPrice = cubit.selectedBudgetTo ?? 500;

    _minPriceController = TextEditingController(text: minPrice.toString());
    _maxPriceController = TextEditingController(text: maxPrice.toString());
  }

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  void _updateSlider(BuildContext context) {
    double? minPrice = double.tryParse(_minPriceController.text);
    double? maxPrice = double.tryParse(_maxPriceController.text);

    if (minPrice != null && maxPrice != null && minPrice <= maxPrice) {
      final cubit = context.read<ProjectsFilterCubit>();

      cubit.selectedBudgetFrom = minPrice;
      cubit.selectedBudgetTo = maxPrice;
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ProjectsFilterCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocale.prices.getString(context),
          style: AppStyles.font24BlackMedium,
        ),
        verticalSpace(16),
        Row(
          children: [
            Expanded(
              child: AppTextFormField(
                labelText: AppLocale.minPrice.getString(context),
                validator: (value) {},
                controller: _minPriceController,
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
                labelText: AppLocale.maxPrice.getString(context),
                validator: (value) {},
                controller: _maxPriceController,
                keyboardType: TextInputType.number,
                onChanged: (value) => _updateSlider(context),
              ),
            ),
          ],
        ),
        PriceFilterRangeWidget(
          minPrice: cubit.selectedBudgetFrom ?? 100,
          maxPrice: cubit.selectedBudgetTo ?? 500,
          onChanged: (values) {
            setState(() {
              _minPriceController.text = values.start.toStringAsFixed(0);
              _maxPriceController.text = values.end.toStringAsFixed(0);
            });
            cubit.selectedBudgetFrom = values.start;
            cubit.selectedBudgetTo = values.end;
          },
        ),
        verticalSpace(16),
      ],
    );
  }
}
