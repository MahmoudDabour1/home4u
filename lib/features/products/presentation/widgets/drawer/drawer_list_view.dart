import 'package:flutter/material.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/products/presentation/widgets/drawer/products_drawer.dart';

import '../../../../../core/routing/routes.dart';
import 'drawer_item_widget.dart';


class DrawerListView extends StatefulWidget {
  final DrawerItem selectedItem;
  const DrawerListView ({super.key, required this.selectedItem});

  @override
  State<DrawerListView> createState() => _DrawerListViewState();
}

class _DrawerListViewState extends State<DrawerListView> {
  late DrawerItem _selectedItem;
  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }
  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: ListView(
        children: DrawerItem.values.map((item) {
          return DrawerItemWidget(
            item: item,
            isSelected: _selectedItem == item,
            onTap: () {
              setState(() {
                _selectedItem = item;
              });
              navigateToScreen(_selectedItem, context);
            },
          );
        }).toList(),
      ),
    );
  }

  void navigateToScreen(DrawerItem item, BuildContext context) {
    switch (item) {
      case DrawerItem.products:
        context.pushNamed(Routes.productsScreen);
        break;
      case DrawerItem.overview:
        context.pushNamed(Routes.businessOverviewScreen);
        break;
      case DrawerItem.settings:
        context.pushNamed(Routes.productsScreen);
        break;
      case DrawerItem.review:
        context.pushNamed(Routes.businessReviewScreen);
        break;
      case DrawerItem.offers:
        context.pushNamed(Routes.productsScreen);
        break;
      case DrawerItem.addProduct:
        context.pushNamed(Routes.productsScreen);
        break;
    }
  }
}
