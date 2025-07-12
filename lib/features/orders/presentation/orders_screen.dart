import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/helpers/shared_pref_keys.dart';
import '../../../core/theming/app_styles.dart';
import '../../../core/widgets/app_back_button.dart';
import '../../../locale/app_locale.dart';
import '../logic/orders_cubit.dart';
import 'widgets/orders_widgets/order_delivered_section.dart';
import 'widgets/orders_widgets/order_pending_section.dart';
import 'widgets/orders_widgets/order_tab_bar_widget.dart';
import 'widgets/orders_widgets/orders_canceled_section.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin , RouteAware{
  final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

  late TabController _tabController;
  String? userId;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabChange);

    _loadUserAndFetchInitialOrders();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    if (!_tabController.indexIsChanging && userId != null) {
      final status = _getStatusByTab(_tabController.index);
      context.read<OrdersCubit>().getOrdersByUserId(userId!, status);
    }
  }
  @override
  void didPopNext() {
    if (userId != null) {
      final status = _getStatusByTab(_tabController.index);
      context.read<OrdersCubit>().getOrdersByUserId(userId!, status);
    }
  }

  Future<void> _loadUserAndFetchInitialOrders() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt(SharedPrefKeys.userId);
    if (id == null) return;

    setState(() {
      userId = id.toString();
    });

    final status = _getStatusByTab(_tabController.index);
    context.read<OrdersCubit>().getOrdersByUserId(userId!, status);
  }

  String _getStatusByTab(int index) {
    switch (index) {
      case 1:
        return 'DELIVERED';
      case 2:
        return 'CANCELED';
      case 0:
      default:
        return 'PENDING';
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              elevation: 1,
              title: Text(
                AppLocale.myOrders.getString(context),
                style: AppStyles.font20BlackMedium,
              ),
              centerTitle: true,
              leading: Padding(
                padding: EdgeInsetsDirectional.only(start: 16.0.w),
                child: const AppBackButton(),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(40.h),
                child: OrderTabBarWidget(tabController: _tabController),
              ),
            ),
          ],
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                OrderPendingSection(),
                OrderDeliveredSection(),
                OrdersCanceledSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
