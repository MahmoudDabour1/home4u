import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';

import '../../../../../core/widgets/app_custom_add_button.dart';
import '../../../../../locale/app_locale.dart';
import 'get_projects_bloc_builder.dart';

class ProjectsBody extends StatelessWidget {
  const ProjectsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCustomAddButton(
          text: AppLocale.addProject.getString(context),
          onPressed: () => context.pushNamed(Routes.addProjectScreen),
        ),
        GetProjectsBlocBuilder(),
      ],
    );
  }
}
