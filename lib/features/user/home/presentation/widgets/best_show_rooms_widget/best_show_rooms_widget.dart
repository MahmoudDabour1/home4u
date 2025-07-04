import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/user/home/presentation/widgets/custom_see_all_row_widget.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../logic/home_cubit.dart';
import 'best_show_rooms_list_view.dart';

class BestShowRoomsWidget extends StatefulWidget {
  const BestShowRoomsWidget({super.key});

  @override
  State<BestShowRoomsWidget> createState() => _BestShowRoomsWidgetState();
}

class _BestShowRoomsWidgetState extends State<BestShowRoomsWidget> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getHighestRated();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          verticalSpace(32),
          CustomSeeAllRowWidget(
            text: AppLocale.theBestShowrooms.getString(context),
            onPressed: () {
              context.pushNamed(Routes.bestShowRoomsScreen);
            },
          ),
          verticalSpace(16),
          BestShowRoomsListView(),
          verticalSpace(32),
        ],
      ),
    );
  }
}
