import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/user/home/presentation/widgets/top_engineers/top_engineers_list_view.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../locale/app_locale.dart';
import '../../../logic/home_cubit.dart';
import '../custom_see_all_row_widget.dart';

class TopEngineersSection extends StatefulWidget {
  const TopEngineersSection({super.key});

  @override
  State<TopEngineersSection> createState() => _TopEngineersSectionState();
}

class _TopEngineersSectionState extends State<TopEngineersSection> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getTopEngineers();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          verticalSpace(16),
          CustomSeeAllRowWidget(
            text: AppLocale.topEngineers.getString(context),
            onPressed: () {
              context.pushNamed(Routes.topEngineersScreen);
            },
          ),
          verticalSpace(8),
          TopEngineersListView(),
        ],
      ),
    );
  }
}
