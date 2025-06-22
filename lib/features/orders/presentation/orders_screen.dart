import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/features/orders/logic/orders_cubit.dart';
import 'package:home4u/features/orders/presentation/widgets/keep_alive_wrapper.dart';
import 'package:home4u/features/orders/presentation/widgets/orders_widgets/order_delivered_section.dart';
import 'package:home4u/features/orders/presentation/widgets/orders_widgets/order_pending_section.dart';
import 'package:home4u/features/orders/presentation/widgets/orders_widgets/order_tab_bar_widget.dart';
import 'package:home4u/features/orders/presentation/widgets/orders_widgets/orders_canceled_section.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/helpers/shared_pref_keys.dart';
import '../../../locale/app_locale.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController tapController;
  String? userId;

  @override
  void initState() {
    super.initState();
    tapController = TabController(length: 3, vsync: this);
    _getUserOrdersById();

    tapController.addListener(
      () {
        if (!tapController.indexIsChanging && userId != null) {
          final status = _getStatusByTab(tapController.index);
          context.read<OrdersCubit>().getOrdersByUserId(userId!, status);
        }
      },
    );
  }

  Future<void> _getUserOrdersById() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt(SharedPrefKeys.userId).toString();
    setState(() {
      userId = id;
    });
    final status = _getStatusByTab(tapController.index);
    context.read<OrdersCubit>().getOrdersByUserId(userId!, status);
  }

  String _getStatusByTab(int index) {
    switch (index) {
      case 0:
        return 'PENDING';
      case 1:
        return 'DELIVERED';
      case 2:
        return 'CANCELED';
      default:
        return 'PENDING';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocale.myOrders.getString(context),
            style: AppStyles.font20BlackMedium,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40.h),
            child: OrderTabBarWidget(tapController: tapController),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    controller: tapController,
                    children: [
                      KeepAliveWrapper(child: OrderPendingSection()),
                      KeepAliveWrapper(child: OrderDeliveredSection()),
                      KeepAliveWrapper(child: OrdersCanceledSection()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
