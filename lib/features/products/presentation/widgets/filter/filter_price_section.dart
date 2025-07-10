import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/widgets/app_text_form_field.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';
import 'package:home4u/features/products/presentation/widgets/filter/price_filter_range_widget.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';

class FilterPriceSection extends StatefulWidget {
  const FilterPriceSection({super.key});

  @override
  State<FilterPriceSection> createState() => _FilterPriceSectionState();
}

class _FilterPriceSectionState extends State<FilterPriceSection> {

  late TextEditingController _minPriceController;
  late TextEditingController _maxPriceController;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<ProductsCubit>();

    double minPrice = cubit.minPrice ?? 100;
    double maxPrice = cubit.maxPrice ?? 500;

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
      final cubit = context.read<ProductsCubit>();

      cubit.minPrice = minPrice;
      cubit.maxPrice = maxPrice;
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ProductsCubit>();
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
          minPrice: cubit.minPrice ?? 100,
          maxPrice: cubit.maxPrice ?? 500,
          onChanged: (values) {
            setState(() {
              _minPriceController.text = values.start.toStringAsFixed(0);
              _maxPriceController.text = values.end.toStringAsFixed(0);
            });
            cubit.minPrice = values.start;
            cubit.maxPrice = values.end;
          },
        ),
        verticalSpace(16),
      ],
    );
  }
}
