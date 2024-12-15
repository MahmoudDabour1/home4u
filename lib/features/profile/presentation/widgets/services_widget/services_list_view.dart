import 'package:flutter/material.dart';
import 'package:home4u/features/profile/presentation/widgets/services_widget/services_list_view_item.dart';

class ServicesListView extends StatelessWidget {
  const ServicesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ServicesListViewItem();
        },
      ),
    );
  }
}
