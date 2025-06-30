import 'package:flutter/material.dart';
import 'package:home4u/core/utils/spacing.dart';

import '../furnish_house_widgets/furnish_house_tab_view_item.dart';

class FurnishHouseTabViewBody extends StatelessWidget {
  const FurnishHouseTabViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (_, __) => verticalSpace(12),
      itemBuilder: (context, index) {
        return FurnishHouseTabViewItem();
      },
    );
  }
}
