import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/helpers/helper_methods.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/features/orders/logic/orders_cubit.dart';
import 'package:home4u/features/orders/logic/orders_state.dart';

import '../../../../../core/widgets/app_custom_button.dart';

class CancelOrderBlocBuilderButton extends StatelessWidget {
  final int orderId;

  const CancelOrderBlocBuilderButton({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<OrdersCubit, OrdersState>(
        listener: (context, state) {
          state.maybeWhen(
            cancelOrderSuccess: (cancelOrder) {
              showToast(message: cancelOrder.data.toString());
            },
            cancelOrderFailure: (error) {
              showToast(message: error);
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          final isLoading = state.maybeWhen(
            cancelOrderLoading: () => true,
            orElse: () => false,
          );

          return AppCustomButton(
            textButton: isLoading ? "Cancelling..." : "Cancel Order",
            btnWidth: 150.w,
            btnHeight: 60.h,
            isLoading: isLoading,
            onPressed: () {
              ///ToDo :  modify this design
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    title: const Text("Cancel Order"),
                    content: const Text(
                        "Are you sure you want to cancel this order?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("No"),
                      ),
                      TextButton(
                        onPressed: () {
                          context
                              .read<OrdersCubit>()
                              .cancelOrder(orderId.toString());
                          context.pushNameAndRemoveUntil(
                            Routes.ordersScreen,
                            predicate: (route) => true,
                          );
                        },
                        child: const Text("Yes"),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
