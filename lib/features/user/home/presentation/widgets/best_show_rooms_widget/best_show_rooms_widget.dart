import 'package:flutter/material.dart';
import 'package:home4u/features/user/home/presentation/widgets/custom_see_all_row_widget.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../../core/utils/spacing.dart';
import 'best_show_rooms_list_view.dart';

class BestShowRoomsWidget extends StatelessWidget {
  const BestShowRoomsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(32),
        CustomSeeAllRowWidget(
          text: AppLocale.theBestShowrooms,
          onPressed: () {},
        ),
        verticalSpace(16),
        BestShowRoomsListView(),
        verticalSpace(32),
      ],
    );
  }
}
