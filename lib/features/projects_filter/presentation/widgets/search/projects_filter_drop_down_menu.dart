import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_state.dart';
import 'package:home4u/features/projects_filter/presentation/projects_filter_screen.dart';
import 'package:home4u/features/user/renovate_your_house/logic/renovate_your_house_cubit.dart';
import 'package:home4u/features/user/renovate_your_house/logic/renovate_your_house_state.dart';

import '../../../../../core/widgets/app_custom_drop_down_button_form_field.dart';
import '../../../logic/projects_filter/projects_filter_cubit.dart';

class ProjectsFilterDropDownMenu extends StatefulWidget {
  const ProjectsFilterDropDownMenu({super.key});

  @override
  State<ProjectsFilterDropDownMenu> createState() =>
      _ProjectsFilterDropDownMenuState();
}

class _ProjectsFilterDropDownMenuState
    extends State<ProjectsFilterDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    final projectFilterCubit = context.read<ProjectsFilterCubit>();
    return BlocBuilder<RenovateYourHouseCubit, RenovateYourHouseState>(
      builder: (context, state) {
        final cubit = context.watch<RenovateYourHouseCubit>();
        ProjectsFilterTabEnum currentTab = projectFilterCubit.currentTab;
        return Column(
          children: <Widget>[
            verticalSpace(32),
            if (currentTab == ProjectsFilterTabEnum.furnishYourHome) ...[],
            if (currentTab == ProjectsFilterTabEnum.requestDesign) ...[
              unitTypeDropDownMenu(projectFilterCubit, cubit),
              verticalSpace(16),
              governmentDropDownMenu(projectFilterCubit),
              verticalSpace(16),
            ],
            if (currentTab == ProjectsFilterTabEnum.renovateYourHouse) ...[
              unitTypeDropDownMenu(projectFilterCubit, cubit),
              verticalSpace(16),
              workTypeDropDownMenu(projectFilterCubit, cubit),
              verticalSpace(16),
              unitStatuesDropDownMenu(projectFilterCubit, cubit),
              verticalSpace(16),
              governmentDropDownMenu(projectFilterCubit),
              verticalSpace(16),
              cityDropDownMenu(projectFilterCubit),
              verticalSpace(16),
            ],
            if (currentTab == ProjectsFilterTabEnum.customPackage) ...[
              unitTypeDropDownMenu(projectFilterCubit, cubit),
              verticalSpace(16),
              customPackageDropDownMenu(projectFilterCubit),
              verticalSpace(16),
            ],
            if (currentTab == ProjectsFilterTabEnum.askEngineer) ...[
              unitTypeDropDownMenu(projectFilterCubit, cubit),
              verticalSpace(16),
              urgencyLevelDownMenu(projectFilterCubit),
              verticalSpace(16),
              engineerTypeDownMenu(projectFilterCubit),
              verticalSpace(16),
              governmentDropDownMenu(projectFilterCubit),
              verticalSpace(16),
              cityDropDownMenu(projectFilterCubit),
              verticalSpace(16),
            ],
            if (currentTab == ProjectsFilterTabEnum.askTechnicalWorker) ...[
              unitTypeDropDownMenu(projectFilterCubit, cubit),
              verticalSpace(16),
              materialDownMenu(projectFilterCubit),
              verticalSpace(16),
              workerTypeDownMenu(projectFilterCubit, cubit),
              verticalSpace(16),
              governmentDropDownMenu(projectFilterCubit),
              verticalSpace(16),
              cityDropDownMenu(projectFilterCubit),
              verticalSpace(16),
            ],
          ],
        );
      },
    );
  }

  AppCustomDropDownButtonFormField customPackageDropDownMenu(
      ProjectsFilterCubit projectFilterCubit) {
    return AppCustomDropDownButtonFormField(
      value: projectFilterCubit.selectedCustomPackageId?.toString(),
      onChanged: (value) {
        projectFilterCubit.selectedCustomPackageId =
            value != null ? int.parse(value) : null;
        setState(() {});
      },
      items: projectFilterCubit.customPackageLookUp.map((unitType) {
        return DropdownMenuItem<String>(
          value: unitType.id.toString(),
          child: Text(unitType.name ?? 'N/A'),
        );
      }).toList(),
      labelText: "Custom Package",
    );
  }

  Widget governmentDropDownMenu(ProjectsFilterCubit projectFilterCubit) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final signUpCubit = context.read<SignUpCubit>();

        return AppCustomDropDownButtonFormField(
          value: projectFilterCubit.selectedGovernorateId?.toString(),
          onChanged: (value) {
            final id = value != null ? int.parse(value) : null;
            projectFilterCubit.selectedGovernorateId = id;
            projectFilterCubit.selectedCityId = null;
            if (id != null) {
              signUpCubit.getCities(id);
            }
            setState(() {});
          },
          items: signUpCubit.governorates.map((unitType) {
            return DropdownMenuItem<String>(
              value: unitType.id.toString(),
              child: Text(unitType.name ?? 'N/A'),
            );
          }).toList(),
          labelText: "Governorate",
        );
      },
    );
  }

  Widget cityDropDownMenu(ProjectsFilterCubit projectFilterCubit) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final signUpCubit = context.read<SignUpCubit>();

        return AppCustomDropDownButtonFormField(
          value: projectFilterCubit.selectedCityId?.toString(),
          onChanged: (value) {
            projectFilterCubit.selectedCityId =
                value != null ? int.parse(value) : null;
            setState(() {});
          },
          items: signUpCubit.cities.map((unitType) {
            return DropdownMenuItem<String>(
              value: unitType.id.toString(),
              child: Text(unitType.name ?? 'N/A'),
            );
          }).toList(),
          labelText: "City",
        );
      },
    );
  }

  Widget workSkillsDropDownMenu(
      ProjectsFilterCubit projectFilterCubit, RenovateYourHouseCubit cubit) {
    return AppCustomDropDownButtonFormField(
      value: projectFilterCubit.selectedWorkSkills?.toString(),
      onChanged: (value) {
        projectFilterCubit.selectedWorkSkills =
            value != null ? int.parse(value) : null;
        setState(() {});
      },
      items: cubit.workSkills.map((unitType) {
        return DropdownMenuItem<String>(
          value: unitType.id.toString(),
          child: Text(unitType.name ?? 'N/A'),
        );
      }).toList(),
      labelText: "Work Skills",
    );
  }

  Widget workTypeDropDownMenu(
      ProjectsFilterCubit projectFilterCubit, RenovateYourHouseCubit cubit) {
    return AppCustomDropDownButtonFormField(
      value: projectFilterCubit.selectedUnitWorkType?.toString(),
      onChanged: (value) {
        projectFilterCubit.selectedUnitWorkType =
            value != null ? int.parse(value) : null;
        setState(() {});
      },
      items: cubit.unitWorkTypes.map((unitType) {
        return DropdownMenuItem<String>(
          value: unitType.id.toString(),
          child: Text(unitType.name ?? 'N/A'),
        );
      }).toList(),
      labelText: "Unit Work Types",
    );
  }

  Widget unitStatuesDropDownMenu(
      ProjectsFilterCubit projectFilterCubit, RenovateYourHouseCubit cubit) {
    return AppCustomDropDownButtonFormField(
      value: projectFilterCubit.selectedUnitStatues?.toString(),
      onChanged: (value) {
        projectFilterCubit.selectedUnitStatues =
            value != null ? int.parse(value) : null;
        setState(() {});
      },
      items: cubit.unitStatuses.map((unitType) {
        return DropdownMenuItem<String>(
          value: unitType.id.toString(),
          child: Text(unitType.name ?? 'N/A'),
        );
      }).toList(),
      labelText: "Unit Statuses",
    );
  }

  Widget unitTypeDropDownMenu(
      ProjectsFilterCubit projectFilterCubit, RenovateYourHouseCubit cubit) {
    return AppCustomDropDownButtonFormField(
      value: projectFilterCubit.selectedUnitTypeId?.toString(),
      onChanged: (value) {
        projectFilterCubit.selectedUnitTypeId =
            value != null ? int.parse(value) : null;
        setState(() {});
      },
      items: cubit.unitTypes.map((unitType) {
        return DropdownMenuItem<String>(
          value: unitType.id.toString(),
          child: Text(unitType.name ?? 'N/A'),
        );
      }).toList(),
      labelText: "Unit Type",
    );
  }

  Widget urgencyLevelDownMenu(ProjectsFilterCubit projectFilterCubit) {
    return AppCustomDropDownButtonFormField(
      value: projectFilterCubit.selectedUrgencyLevelId?.toString(),
      onChanged: (value) {
        projectFilterCubit.selectedUrgencyLevelId =
            value != null ? int.parse(value) : null;
        setState(() {});
      },
      items: projectFilterCubit.urgencyLevelLookUp.map((unitType) {
        return DropdownMenuItem<String>(
          value: unitType.id.toString(),
          child: Text(unitType.name ?? 'N/A'),
        );
      }).toList(),
      labelText: "Urgency Level",
    );
  }

  Widget engineerTypeDownMenu(ProjectsFilterCubit projectFilterCubit) {
    return AppCustomDropDownButtonFormField(
      value: projectFilterCubit.selectedEngineerTypeId?.toString(),
      onChanged: (value) {
        projectFilterCubit.selectedEngineerTypeId =
            value != null ? int.parse(value) : null;
        setState(() {});
      },
      items: projectFilterCubit.engineerTypeLookUp.map((unitType) {
        return DropdownMenuItem<String>(
          value: unitType.id.toString(),
          child: Text(unitType.name ?? 'N/A'),
        );
      }).toList(),
      labelText: "Engineer Type",
    );
  }

  Widget workerTypeDownMenu(
      ProjectsFilterCubit projectFilterCubit, RenovateYourHouseCubit cubit) {
    return AppCustomDropDownButtonFormField(
      value: projectFilterCubit.selectedWorkerTypeId?.toString(),
      onChanged: (value) {
        projectFilterCubit.selectedWorkerTypeId =
            value != null ? int.parse(value) : null;
        setState(() {});
      },
      items: projectFilterCubit.workerTypeLookUp.map((unitType) {
        return DropdownMenuItem<String>(
          value: unitType.id.toString(),
          child: Text(unitType.name ?? 'N/A'),
        );
      }).toList(),
      labelText: "Worker Type",
    );
  }

  Widget materialDownMenu(ProjectsFilterCubit projectFilterCubit) {
    return AppCustomDropDownButtonFormField(
      value: projectFilterCubit.selectedMaterialId?.toString(),
      onChanged: (value) {
        projectFilterCubit.selectedMaterialId =
            value != null ? int.parse(value) : null;
        setState(() {});
      },
      items: projectFilterCubit.materialLookUp.map((unitType) {
        return DropdownMenuItem<String>(
          value: unitType.id.toString(),
          child: Text(unitType.name ?? 'N/A'),
        );
      }).toList(),
      labelText: "Material",
    );
  }
}
