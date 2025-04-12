import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/utils/my_bloc_observer.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';
import 'package:home4u/features/products/presentation/widgets/products_fancy_image.dart';
import 'package:home4u/features/products/presentation/widgets/products_item_data.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/utils/spacing.dart';
import '../../data/models/products_response_model.dart';

class ProductsItem extends StatelessWidget {
  final Content? content;

  const ProductsItem({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: GestureDetector(
        onTap: ()async{
      if (content != null && content!.id != null) {
        context.read<ProductsCubit>().getProductById(content!.id!);
        context.pushNamed(
          Routes.productsDetailsScreen,
          arguments: content!.id,
        );
      } else {
        logger.w("Error: Content is null");
      }
        },
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.50,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackColor.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ProductsFancyImage(
                    content: content,
                  ),
                  Expanded(
                    child: ProductsItemData(
                      content: content,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(16),
          ],
        ),
      ),
    );
  }
}
