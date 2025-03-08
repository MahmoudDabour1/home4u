import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/features/exhibition/presentation/widgets/add_product/up_down_form_field.dart';
import 'package:home4u/features/products/logic/products_state.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../../locale/app_locale.dart';
import '../../../../products/logic/products_cubit.dart';
import '../../../logic/business_add_product_cubit.dart';

class AddProductColorsAndStock extends StatefulWidget {
  const AddProductColorsAndStock({super.key});

  @override
  State<AddProductColorsAndStock> createState() =>
      _AddProductColorsAndStockState();
}

class _AddProductColorsAndStockState extends State<AddProductColorsAndStock> {
  String? selectedColor;
  final List<Map<String, dynamic>> selectedColorsAndStock = [];

  @override
  Widget build(BuildContext context) {
    final businessCubit = context.read<BusinessAddProductCubit>();
    final productsCubit = context.read<ProductsCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.h,
      children: [
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            return AppCustomDropDownButtonFormField(
              value: selectedColor,
              items: productsCubit.colors.map((color) {
                return DropdownMenuItem<String>(
                  value: color.id.toString(),
                  child: Text(
                    color.name!,
                    style: AppStyles.font16BlackLight,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedColor = value;
                });
              },
              onSaved: (value) {
                businessCubit.selectedColor = int.parse(value!);
              },
              labelText: AppLocale.color.getString(context),
            );
          },
        ),
        Row(
          spacing: 8.w,
          children: [
            Expanded(
              child: UpDownFormField(
                label: AppLocale.stock.getString(context),
                controller: businessCubit.productStockAmountController,
                focusNode: FocusNode(),
                validationMessage: "Please enter a valid stock amount",
              ),
            ),
            Expanded(
              child: AppCustomButton(
                onPressed: () {
                  if (selectedColor != null &&
                      businessCubit
                          .productStockAmountController.text.isNotEmpty) {
                    int stock = int.parse(
                        businessCubit.productStockAmountController.text);
                    if (stock > 0) {
                      setState(() {
                        selectedColorsAndStock.add({
                          "color": selectedColor!,
                          "colorObject": productsCubit.colors.firstWhere(
                                  (element) =>
                              element.id.toString() == selectedColor),
                          "stock": stock,
                        });
                      });
                    }
                  }
                },
                textButton: AppLocale.add.getString(context),
                btnHeight: 60.h,
                btnWidth: 200.w,
              ),
            ),
          ],
        ),
        if (selectedColorsAndStock.isNotEmpty)
          Wrap(
            spacing: 8.w,
            children: selectedColorsAndStock.map((item) {
              final colorObj = item["colorObject"];
              return Chip(
                avatar: CircleAvatar(
                  radius: 16.r,
                  backgroundColor: Color(int.parse(colorObj.colorCode!)),
                ),
                label: Text('${item["stock"]} pieces'),
                deleteIcon: Icon(Icons.close),
                onDeleted: () {
                  setState(() {
                    selectedColorsAndStock.remove(item);
                  });
                },
                backgroundColor: AppColors.whiteColor,
              );
            }).toList(),
          ),
      ],
    );
  }
}
