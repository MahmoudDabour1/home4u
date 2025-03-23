import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/exhibition/logic/business_add_product_cubit.dart';
import 'package:home4u/features/products/data/models/products_response_model.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/app_custom_icon_button.dart';
import '../../logic/products_cubit.dart';
import 'product_delete_alert_dialog.dart';

class ProductsFirstTextAndButtons extends StatelessWidget {
  final Content? content;

  const ProductsFirstTextAndButtons({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Expanded(
         child: Text(
            content!.name ?? "Modern l-Shaped Sofa",
            overflow:TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: true,
            style: AppStyles.font16BlackLight,
          ),
       ),
        Row(
          children: [
            AppCustomIconButton(
              onPressed: () async {
                final cubit = context.read<ProductsCubit>();
                await cubit.getProductById(content!.id!);
                context.pushNamed(
                  Routes.businessAddProductScreen,
                  arguments: cubit.productPreviewResponse,
                );
                context.read<BusinessAddProductCubit>().isUpdateData = true;
              },
              image: AppAssets.editIconSvg,
            ),
            AppCustomIconButton(
              onPressed: () => showDialog(
                builder: (context) => ProductDeleteAlertDialog(
                  productId: content?.id ?? 0,
                ),
                context: context,
              ),
              image: AppAssets.deleteIconSvg,
            ),
          ],
        ),
      ],
    );
  }
}
