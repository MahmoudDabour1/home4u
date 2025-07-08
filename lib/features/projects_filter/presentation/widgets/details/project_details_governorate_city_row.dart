import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/details/project_details_item_value.dart';
import 'package:home4u/locale/app_locale.dart';

class ProjectDetailsGovernorateCityRow extends StatelessWidget {
  final String? city;
  final String governorate;

  const ProjectDetailsGovernorateCityRow({
    super.key,
    this.city,
    required this.governorate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ProjectDetailsItemValue(
            itemTitle: AppLocale.governorate.getString(context),
            value: governorate,
          ),
        ),
        city == null ? SizedBox.shrink() : Expanded(
          flex: 2,
          child: ProjectDetailsItemValue(
            itemTitle: AppLocale.city.getString(context),
            value: city ?? 'N/A',
          ),
        ),
      ],
    );
  }
}
