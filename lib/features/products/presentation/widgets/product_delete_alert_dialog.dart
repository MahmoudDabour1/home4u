import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';
import 'package:home4u/features/products/logic/products_state.dart';

import '../../../../core/helpers/helper_methods.dart';
import '../../../../core/widgets/app_custom_alert_dialog.dart';
import '../../../../locale/app_locale.dart';

class ProductDeleteAlertDialog extends StatelessWidget {
  final int? productId;

  const ProductDeleteAlertDialog({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
      final cubit = context.read<ProductsCubit>();

      return AppCustomAlertDialog(
        onDeleteButtonPressed: () async {
          await cubit.deleteProduct(productId!);
          if (!context.mounted) return;
          await showToast(
            message: AppLocale.deletedSuccessfully.getString(context),
          );
          context.pop();
        },
        isLoading: state is DeleteProductLoading,
      );
    });
  }
}
