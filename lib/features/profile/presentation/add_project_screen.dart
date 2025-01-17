import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/profile/logic/project/project_cubit.dart';
import 'package:home4u/features/profile/presentation/widgets/add_project_widgets/add_project_info.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../locale/app_locale.dart';
import '../../auth/widgets/auth_welcome_data.dart';

class AddProjectScreen extends StatelessWidget {
  const AddProjectScreen({super.key});

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
                  headText: AppLocale.addProject.getString(context),
                  subText: '',
                ),
                AddProjectInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
