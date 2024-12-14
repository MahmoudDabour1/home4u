import 'package:flutter/material.dart';
import 'package:home4u/core/theming/app_strings.dart';
import 'package:home4u/features/auth/widgets/auth_welcome_data.dart';
import 'package:home4u/features/profile/presentation/widgets/add_project_widgets/add_project_info.dart';

class AddProjectScreen extends StatelessWidget {
  const AddProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthWelcomeData(
                headText: AppStrings.addProject,
                subText: '',
              ),
              AddProjectInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
