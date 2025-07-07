import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/user/home/presentation/widgets/custom_see_all_row_widget.dart';
import 'package:home4u/features/user/home/presentation/widgets/top_workers/top_worker_list_view.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../locale/app_locale.dart';
import '../../../logic/home_cubit.dart';

class TopWorkersSection extends StatefulWidget {
  const TopWorkersSection({super.key});

  @override
  State<TopWorkersSection> createState() => _TopWorkersSectionState();
}

class _TopWorkersSectionState extends State<TopWorkersSection> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getTopWorkers();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          verticalSpace(16),
          CustomSeeAllRowWidget(
            text: AppLocale.topWorkers.getString(context),
            onPressed: () {
              context.pushNamed(Routes.topWorkersScreen);
            },
          ),
          verticalSpace(8),
          TopWorkerListView(),
        ],
      ),
    );
  }
}
