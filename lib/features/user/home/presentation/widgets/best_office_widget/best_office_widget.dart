import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../../../../../core/utils/spacing.dart';
import '../../../../../../locale/app_locale.dart';
import '../custom_see_all_row_widget.dart';
import 'best_office_list_view.dart';

class BestOfficeWidget extends StatelessWidget {
  const BestOfficeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(32),
        CustomSeeAllRowWidget(
          text: AppLocale.theBestOffices.getString(context),
          onPressed: () {},
        ),
        verticalSpace(16),
        BestOfficeListView(),
      ],
    );
  }
}
