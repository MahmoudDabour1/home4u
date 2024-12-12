import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/widgets/app_custom_loading_indicator.dart';
import 'package:home4u/core/widgets/get_common_input_decoration.dart';

import '../theming/app_colors.dart';
import '../theming/app_styles.dart';
import '../utils/spacing.dart';

class AppCustomDropDownMultiSelectButton extends StatelessWidget {
  final List<String> selectedValues;
  final void Function(List<String>) onChanged;
  final void Function(List<String>?)? onSaved;
  final List<String> items;
  final String labelText;
  final FormFieldValidator<List<String>>? validator;
  final ErrorBuilder? popUpEmptyBuilder;
  final bool isEnabled;

  const AppCustomDropDownMultiSelectButton({
    super.key,
    required this.selectedValues,
    required this.onChanged,
    required this.items,
    required this.labelText,
    this.validator,
    this.onSaved,
    this.popUpEmptyBuilder,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>.multiSelection(
      mode: Mode.form,
      enabled: isEnabled,
      selectedItems: [...selectedValues],
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      items: (filter, loadProps) => Future.value(items),
      // dropdownBuilder: (context, List<String>? items) {
      //   return Text(
      //     items!.join(", "),
      //     style: AppStyles.font16BlackLight,
      //   );
      // },
      decoratorProps: DropDownDecoratorProps(
        decoration: getCommonInputDecoration(labelText: labelText).copyWith(
          contentPadding: EdgeInsets.symmetric(
            vertical: 29.h,
            horizontal: 20.w,
          ),
        ),
      ),
      popupProps: PopupPropsMultiSelection.dialog(
        dialogProps: DialogProps(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          backgroundColor: AppColors.whiteColor,
        ),
        containerBuilder: (context, popupWidget) {
          return Padding(
            padding: const EdgeInsets.all(16.0).h,
            child: popupWidget,
          );
        },
        loadingBuilder: (context, searchEntry) => Center(
          child: AppCustomLoadingIndicator(),
        ),
        emptyBuilder: (context, searchEntry) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppCustomLoadingIndicator(
              indicatorColor: AppColors.primaryColor,
            ),
            verticalSpace(16),
            Text(
              "Choose your engineer type first",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        errorBuilder: popUpEmptyBuilder ?? showPopUpEmptyBuilder,
      ),
      clickProps: ClickProps(
        hoverColor: AppColors.primaryColor,
      ),
    );
  }

  Widget showPopUpEmptyBuilder(context, error, reload) => Center(
        child: Text(
          "Error loading items,Try again",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16.sp,
          ),
        ),
      );
}
