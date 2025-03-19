import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/routing/router_observer.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/features/exhibition/presentation/widgets/add_product/up_down_form_field.dart';
import 'package:home4u/features/products/logic/products_state.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../../../locale/app_locale.dart';
import '../../../../products/data/models/product_preview_response.dart';
import '../../../../products/logic/products_cubit.dart';
import '../../../logic/business_add_product_cubit.dart';

class AddProductColorsAndStock extends StatefulWidget {
  final ProductPreviewResponse? productData;

  const AddProductColorsAndStock({super.key, this.productData});

  @override
  State<AddProductColorsAndStock> createState() =>
      _AddProductColorsAndStockState();
}

class _AddProductColorsAndStockState extends State<AddProductColorsAndStock> {
  String? selectedColorId;
  late List<Map<String, dynamic>> selectedColorsAndStock = [];

  @override
  void initState() {
    super.initState();
    final businessCubit = context.read<BusinessAddProductCubit>();
    if (widget.productData != null) {
      selectedColorsAndStock = widget.productData?.data.stocks
              .map(
                (stock) => {
                  "colorId": stock.color.id,
                  "hexColor": stock.color.hexColor,
                  "stock": stock.amount,
                },
              )
              .toList() ??
          [];
      businessCubit.selectedColor = selectedColorsAndStock.isNotEmpty
          ? selectedColorsAndStock.first["colorId"]
          : null;
    } else {
      selectedColorsAndStock = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final businessCubit = context.read<BusinessAddProductCubit>();
    final productsCubit = context.read<ProductsCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            return AppCustomDropDownButtonFormField(
              value: selectedColorId,
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
                  selectedColorId = value;
                });
              },
              onSaved: (value) {
                businessCubit.selectedColor = int.parse(value!);
              },
              labelText: AppLocale.color.getString(context),
            );
          },
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: UpDownFormField(
                label: AppLocale.stock.getString(context),
                controller: businessCubit.productStockAmountController,
                focusNode: FocusNode(),
                validationMessage: "Please enter a valid stock amount",
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: AppCustomButton(
                onPressed: () {
                  if (selectedColorId != null &&
                      businessCubit
                          .productStockAmountController.text.isNotEmpty) {
                    int stock = int.parse(
                        businessCubit.productStockAmountController.text);
                    if (stock > 0) {
                      final selectedColorObject =
                          productsCubit.colors.firstWhere(
                        (element) => element.id.toString() == selectedColorId,
                        orElse: () => throw Exception("Color not found!"),
                      );

                      final existingIndex = selectedColorsAndStock.indexWhere(
                          (item) => item["colorId"] == selectedColorObject.id);

                      if (existingIndex != -1) {
                        selectedColorsAndStock[existingIndex]["stock"] += stock;
                      } else {
                        selectedColorsAndStock.add({
                          "colorId": selectedColorObject.id,
                          "hexColor": selectedColorObject.hexColor,
                          "stock": stock,
                        });
                        logger.w(
                            "selectedColorsAndStock: $selectedColorsAndStock");
                      }
                      businessCubit
                          .updateSelectedColorsAndStock(selectedColorsAndStock);
                      setState(() {
                        selectedColorId = null;
                        businessCubit.productStockAmountController.clear();
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
        SizedBox(height: 16.h),
        if (selectedColorsAndStock.isNotEmpty)
          Wrap(
            spacing: 8.w,
            children: [
              ...selectedColorsAndStock.map((item) {
                final colorHex = item["hexColor"];
                return _buildColorChip(item, colorHex, businessCubit);
              }),
            ],
          ),
      ],
    );
  }

  Color _hexToColor(String hex) {
    hex = hex.replaceFirst('#', '');
    return Color(int.parse('0xFF$hex'));
  }

  Widget _buildColorChip(Map<String, dynamic> item, String colorHex,
      BusinessAddProductCubit cubit) {
    return Chip(
      avatar: CircleAvatar(
        radius: 16.r,
        backgroundColor: _hexToColor(colorHex),
      ),
      label: Text('${item["stock"]} pieces'),
      deleteIcon: Icon(Icons.close, color: Colors.black),
      onDeleted: () {
        setState(() {
          selectedColorsAndStock.remove(item);
          cubit.updateSelectedColorsAndStock(
            selectedColorsAndStock,
          );
        });
      },
      backgroundColor: AppColors.whiteColor,
    );
  }
}
