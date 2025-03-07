import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/widgets/app_text_form_field.dart';
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
  double _minPrice = 100;
  double _maxPrice = 500;

  late TextEditingController _minPriceController;
  late TextEditingController _maxPriceController;

  @override
  void initState() {
    super.initState();
    _minPriceController = TextEditingController(text: _minPrice.toString());
    _maxPriceController = TextEditingController(text: _maxPrice.toString());
  }

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  void _updateSlider() {
    double? minPrice = double.tryParse(_minPriceController.text);
    double? maxPrice = double.tryParse(_maxPriceController.text);

    if (minPrice != null && maxPrice != null && minPrice <= maxPrice) {
      setState(() {
        _minPrice = minPrice;
        _maxPrice = maxPrice;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                onChanged: (value) => _updateSlider(),
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
                onChanged: (value) => _updateSlider(),
              ),
            ),
          ],
        ),
        PriceFilterRangeWidget(
          minPrice: _minPrice,
          maxPrice: _maxPrice,
          onChanged: (values) => setState(() {
            _minPrice = values.start;
            _maxPrice = values.end;
            _minPriceController.text = _minPrice.toStringAsFixed(0);
            _maxPriceController.text = _maxPrice.toStringAsFixed(0);
          }),
        ),
        verticalSpace(16),
      ],
    );
  }
}
