import 'package:flutter/material.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/renovate_house_widgets/renovate_house_tab_view_item.dart';

import '../../../../../core/utils/spacing.dart';

class RenovateHouseTabViewBody extends StatelessWidget {
  const RenovateHouseTabViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => RenovateHouseTabViewItem(),
      separatorBuilder: (_, __) => verticalSpace(12),
      itemCount: 5,
    );
  }
}
