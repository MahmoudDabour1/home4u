import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';

import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../../../locale/app_locale.dart';

class FilterButtons extends StatelessWidget {
  final VoidCallback? onConfirm;
  const FilterButtons({super.key, this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(32),
        AppCustomButton(
            textButton: AppLocale.confirm.getString(context),
            btnWidth: MediaQuery.sizeOf(context).width,
            btnHeight: 50.h,
            onPressed: onConfirm??() {
              final cubit = context.read<ProductsCubit>();
              cubit.resetPagination();
              cubit.getProducts();
              context.pop();
            }),
        verticalSpace(16),
        AppCustomButton(
            textButton: AppLocale.cancel.getString(context),
            btnWidth: MediaQuery.sizeOf(context).width,
            btnHeight: 50.h,
            isBorder: true,
            onPressed: () {
              context.pop();
            }),
      ],
    );
  }
}
