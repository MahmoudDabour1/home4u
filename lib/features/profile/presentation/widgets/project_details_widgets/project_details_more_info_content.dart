import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/locale/app_locale.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../data/models/projects/project_response.dart';

class MoreInfoContent extends StatelessWidget {
  final ProjectResponse project;

  const MoreInfoContent({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      animate: true,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: RichText(
        text: TextSpan(
          children: [
            _buildTitle('${AppLocale.usedTools.getString(context)}: \n'),
            TextSpan(
              text: '${project.data.tools ?? ''}\n\n',
              style: AppStyles.font16BlackMedium,
            ),
            _buildTitle('${AppLocale.startData.getString(context)}: \n'),
            TextSpan(
              text: '${formatDate(project.data.startDate) ?? ''}\n\n',
              style: AppStyles.font16BlackMedium,
            ),
            _buildTitle('${AppLocale.endData.getString(context)}: \n'),
            TextSpan(
              text: formatDate(project.data.endDate) ?? '',
              style: AppStyles.font16BlackMedium,
            ),
          ],
        ),
      ),
    );
  }

  TextSpan _buildTitle(String title) {
    return TextSpan(
      text: title,
      style: AppStyles.font16DarkBlueBold.copyWith(
        color: Colors.blue,
      ),
    );
  }
}
