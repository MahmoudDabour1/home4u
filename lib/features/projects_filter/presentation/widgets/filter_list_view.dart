import 'package:flutter/material.dart';
import 'package:home4u/core/utils/spacing.dart';

import 'filter_list_view_item.dart';

class FilterListView extends StatelessWidget {
  const FilterListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return verticalSpace(16);
      },
        itemCount: 5,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return FilterListViewItem();
        });
  }
}
