import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/features/user/home/logic/home_cubit.dart';

import '../../../../../../core/utils/spacing.dart';
import '../../../../../../locale/app_locale.dart';
import '../custom_see_all_row_widget.dart';
import 'best_office_list_view.dart';

class BestOfficeWidget extends StatefulWidget {
  const BestOfficeWidget({super.key});

  @override
  State<BestOfficeWidget> createState() => _BestOfficeWidgetState();
}

class _BestOfficeWidgetState extends State<BestOfficeWidget> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getTopBestSeller();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          verticalSpace(16),
          CustomSeeAllRowWidget(
            text: AppLocale.topBestSeller.getString(context),
            onPressed: () {
              context.pushNamed(Routes.bestOfficesScreen);
            },
          ),
          verticalSpace(8),
          BestOfficeListView(),
        ],
      ),
    );
  }


}
