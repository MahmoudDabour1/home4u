import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/utils/spacing.dart';

import '../drawer_header_widget.dart';
import 'drawer_list_view.dart';

class ProductsDrawer extends StatelessWidget {
  final DrawerItem selectedItem;

  const ProductsDrawer({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      width: MediaQuery.sizeOf(context).width * 0.65,
      child: Column(
        children: [
          verticalSpace(64),
          DrawerHeaderWidget(),
          verticalSpace(32),
          DrawerListView(
            selectedItem: selectedItem,
          )
        ],
      ),
    );
  }
}

enum DrawerItem {
  products,
  overview,
  settings,
  review,
  offers,
  addProduct,
}
