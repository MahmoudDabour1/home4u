import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/profile/data/models/projects/get_projects_response_model.dart';
import 'package:home4u/features/profile/data/models/projects/project_response.dart';
import 'package:home4u/features/profile/presentation/widgets/project_details_widgets/project_details_content_images.dart';
import 'package:home4u/features/profile/presentation/widgets/project_details_widgets/project_details_header.dart';
import 'package:home4u/features/profile/presentation/widgets/project_details_widgets/project_details_more_info_content.dart';
import 'package:home4u/features/profile/presentation/widgets/project_details_widgets/project_details_projects_grid_view.dart';
import 'package:home4u/features/profile/presentation/widgets/project_details_widgets/project_details_rating.dart';
import 'package:home4u/features/profile/presentation/widgets/project_details_widgets/project_details_show_more_info_button.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../auth/widgets/auth_welcome_data.dart';

class ProjectDetailsContent extends StatelessWidget {
  final dynamic profileData;
  final ProjectResponse project;
  final GetProjectsResponseModel? projects;
  final bool showMoreInfo;
  final VoidCallback onShowMoreInfo;

  const ProjectDetailsContent({
    super.key,
    required this.profileData,
    required this.project,
    required this.projects,
    required this.showMoreInfo,
    required this.onShowMoreInfo,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthWelcomeData(
            headText: profileData?.data?.user.userType?.name??profileData?.data?.type?.name ?? "",
            subText: '',
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0.w,
              vertical: 16.0.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProjectDetailsHeader(profileData: profileData),
                verticalSpace(32),
                ProjectDetailsContentImages(project: project),
                verticalSpace(16),
                Text(
                  project.data.description ?? '',
                  style: AppStyles.font16BlackMedium,
                ),
                verticalSpace(8),
                ProjectDetailsRating(),
                if (!showMoreInfo)
                  ProjectDetailsShowMoreInfoButton(
                      onShowMoreInfo: onShowMoreInfo),
                verticalSpace(16),
                if (showMoreInfo) MoreInfoContent(project: project),
                verticalSpace(32),
                _moreProjectsHeader(),
                verticalSpace(16),
                ProjectDetailsProjectsGridView(projects: projects),
                verticalSpace(16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _moreProjectsHeader() {
    return Text(
      'More Projects By ${profileData?.data?.user?.firstName ?? ''} ${profileData?.data?.user?.lastName ?? ''}',
      style: AppStyles.font16BlackSemiBold,
    );
  }
}
