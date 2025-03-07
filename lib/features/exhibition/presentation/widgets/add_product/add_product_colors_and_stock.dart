import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/exhibition/presentation/widgets/add_product/up_down_form_field.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../../locale/app_locale.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/core/utils/spacing.dart';

import '../../../../../core/widgets/app_custom_button.dart';
import 'add_product_basic_details_stepper.dart';
import 'add_product_materials_and_specs.dart';

class AddProductColorsAndStock extends StatefulWidget {
  const AddProductColorsAndStock({super.key});

  @override
  State<AddProductColorsAndStock> createState() =>
      _AddProductColorsAndStockState();
}

class _AddProductColorsAndStockState extends State<AddProductColorsAndStock> {
  String? selectedColor;
  List<String> colors = [
    "green",
    "red",
    "blue",
    "yellow",
    "black",
    "white",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.h,
      children: [
        AppCustomDropDownButtonFormField(
          value: selectedColor,
          items: colors.map((type) {
            return DropdownMenuItem<String>(
              value: type,
              child: Text(
                type,
                style: AppStyles.font16BlackLight,
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedColor = value;
            });
          },
          onSaved: (value) {},
          labelText: AppLocale.color.getString(context),
        ),
        Row(
          spacing: 16.w,
          children: [
            Expanded(
              child: UpDownFormField(
                label: AppLocale.stock.getString(context),
                controller: TextEditingController(),
                focusNode: FocusNode(),
                validationMessage: "Please enter a valid height",
              ),
            ),
            Expanded(
              child: AppCustomButton(
                onPressed: () {},
                textButton: AppLocale.add.getString(context),
                btnHeight: 60.h,
                btnWidth: 200.w,
              ),
            ),
          ],
        ),
        Wrap(
          spacing: 8.w,

          children: [
            Chip(
              avatar: CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.red,
              ),
              label: Text('100 pieces'),
              deleteIcon: Icon(Icons.close),
              onDeleted: () {},
              backgroundColor: AppColors.whiteColor,
            ),
            Chip(
              avatar: CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.blue,
              ),
              label: Text('1000 pieces'),
              deleteIcon: Icon(Icons.close),
              onDeleted: () {},
              backgroundColor: AppColors.whiteColor,
            ),
            Chip(
              avatar: CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.red,
              ),
              label: Text('1 pieces'),
              deleteIcon: Icon(Icons.close),
              onDeleted: () {},
              backgroundColor: AppColors.whiteColor,
            ),
            Chip(
              avatar: CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.blue,
              ),
              label: Text('10 pieces'),
              deleteIcon: Icon(Icons.close),
              onDeleted: () {},
              backgroundColor: AppColors.whiteColor,
            ),
            Chip(
              avatar: CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.red,
              ),
              label: Text('10 pieces'),
              deleteIcon: Icon(Icons.close),
              onDeleted: () {},
              backgroundColor: AppColors.whiteColor,
            ),
            Chip(
              avatar: CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.blue,
              ),
              label: Text('10 pieces'),
              deleteIcon: Icon(Icons.close),
              onDeleted: () {},
              backgroundColor: AppColors.whiteColor,
            ),
            Chip(
              avatar: CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.red,
              ),
              label: Text('10 pieces'),
              deleteIcon: Icon(Icons.close),
              onDeleted: () {},
              backgroundColor: AppColors.whiteColor,
            ),
            Chip(
              avatar: CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.blue,
              ),
              label: Text('10 pieces'),
              deleteIcon: Icon(Icons.close),
              onDeleted: () {},
              backgroundColor: AppColors.whiteColor,
            ),
            Chip(
              avatar: CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.red,
              ),
              label: Text('10 pieces'),
              deleteIcon: Icon(Icons.close),
              onDeleted: () {},
              backgroundColor: AppColors.whiteColor,
            ),
            Chip(
              avatar: CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.blue,
              ),
              label: Text('1 pieces'),
              deleteIcon: Icon(Icons.close),
              onDeleted: () {},
              backgroundColor: AppColors.whiteColor,
            ),
            Chip(
              avatar: CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.red,
              ),
              label: Text('10 pieces'),
              deleteIcon: Icon(Icons.close),
              onDeleted: () {},
              backgroundColor: AppColors.whiteColor,
            ),
            Chip(
              avatar: CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.blue,
              ),
              label: Text('10 pieces'),
              deleteIcon: Icon(Icons.close),
              onDeleted: () {},
              backgroundColor: AppColors.whiteColor,
            ),
          ],
        ),
      ],
    );
  }
}
