import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';

import '../../../../products/presentation/widgets/filter/filter_buttons.dart';
import '../../../logic/projects_filter/projects_filter_cubit.dart';
import '../../projects_filter_screen.dart';

class ProjectFilterButtonsWidget extends StatelessWidget {
  const ProjectFilterButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FilterButtons(
      onConfirm: () {
        final cubit = context.read<ProjectsFilterCubit>();
        switch (cubit.currentTab) {
          case ProjectsFilterTabEnum.requestDesign:
            cubit.getRequestDesignFilter(isRefresh: true);
            break;
          case ProjectsFilterTabEnum.customPackage:
            cubit.getFixedPackagesFilter(isRefresh: true);
            break;
          case ProjectsFilterTabEnum.renovateYourHouse:
            cubit.renovateHouseCustomPackages(isRefresh: true);
            break;
          case ProjectsFilterTabEnum.askEngineer:
            cubit.askEngineerFilter(isRefresh: true);
            break;
          case ProjectsFilterTabEnum.askTechnicalWorker:
            cubit.askTechnicalWorkerFilter(isRefresh: true);
            break;
        }
        context.pop();
      },
    );
  }
}
