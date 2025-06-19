import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_order_details_widgets/cart_order_details_content.dart';
import 'package:home4u/features/cart/presentation/widgets/cart_order_details_widgets/cart_order_details_header.dart';

import '../../../core/routing/routes.dart';
import '../logic/cart_cubit.dart';
import '../logic/cart_state.dart';

class CartOrderDetailsScreen extends StatelessWidget {
  const CartOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit,CartState>(
      listener: (BuildContext context, CartState<dynamic> state) {
        state.maybeWhen(
          insertOrderSuccess: (_) {
            context.pushNamed(Routes.checkOutDoneScreen);
          },
          insertOrderFailure: (error) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Try Again"),
                content: const Text("Something went wrong"),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text("Ok"),
                  ),
                ],
              ),
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 32.h, left: 24.w, right: 24.w),
              child: Column(
                children: [
                  const CartOrderDetailsHeader(),
                  verticalSpace(16),
                  const CartOrderDetailsContent(),
                  verticalSpace(16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
