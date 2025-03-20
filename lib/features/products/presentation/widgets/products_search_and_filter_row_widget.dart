import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/debouncer_helper.dart';
import '../../../../core/widgets/app_custom_search_text_field.dart';
import '../../logic/products_cubit.dart';
import 'filter/products_filter_button.dart';

class ProductsSearchAndFilterRowWidget extends StatelessWidget {
  const ProductsSearchAndFilterRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Debouncer debouncer = Debouncer(milliseconds: 500);
    return  SliverPadding(
      padding: EdgeInsets.only(
          left: 24.w, right: 24.w, top: 16.h, bottom: 32.h),
      sliver: SliverToBoxAdapter(
        child: Row(
          spacing: 16.w,
          children: [
            Expanded(
              child: AppCustomSearchTextField(
                controller:
                context.read<ProductsCubit>().searchController,
                onChanged: (value) {
                  //apply search
                  debouncer.run(() {
                    context.read<ProductsCubit>().getProducts();
                  });
                },
              ),
            ),
            ProductsFilterButton(),
          ],
        ),
      ),
    );
  }
}
