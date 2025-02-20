import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/profile/logic/project/project_cubit.dart';
import 'package:home4u/features/profile/presentation/widgets/add_project_widgets/add_project_info.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../locale/app_locale.dart';
import '../../auth/widgets/auth_welcome_data.dart';
import '../data/models/projects/get_projects_response_model.dart';

class AddProjectScreen extends StatelessWidget {
  final ProjectsData? projectData;

  const AddProjectScreen({super.key, required this.projectData});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProjectCubit>(
      create: (_) => sl<ProjectCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AuthWelcomeData(
                  headText: projectData != null
                      ? AppLocale.updateProject.getString(context)
                      : AppLocale.addProject.getString(context),
                  subText: '',
                ),
                AddProjectInfo(
                  projectData: projectData,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
