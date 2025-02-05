import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/project_body_grid_view_item.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/rating_container_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../auth/widgets/auth_welcome_data.dart';
import '../../../data/models/profile/profile_response_model.dart';
import '../../../data/models/projects/get_projects_response_model.dart';

class ProjectsDetailsShimmerWidget extends StatefulWidget {
  const ProjectsDetailsShimmerWidget({super.key});

  @override
  State<ProjectsDetailsShimmerWidget> createState() =>
      _ProjectsDetailsShimmerWidgetState();
}

class _ProjectsDetailsShimmerWidgetState
    extends State<ProjectsDetailsShimmerWidget> {
  bool showMoreInfo = false;
  ProfileResponseModel? profileDataCached;
  GetProjectsResponseModel? projects;

  @override
  void initState() {
    super.initState();
    _initializeProfileData();
  }

  Future<void> _initializeProfileData() async {
    var profileBox = await Hive.openBox<ProfileResponseModel>(kProfileBox);
    var profileData = profileBox.get(kProfileData);
    var projectBox = await Hive.openBox<GetProjectsResponseModel>(kProjectsBox);
    var projectsData = projectBox.get(kProjectsKey);
    profileDataCached = profileData;
    projects = projectsData;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthWelcomeData(
            headText: profileDataCached?.data?.type?.name ?? "",
            subText: '',
          ),
          verticalSpace(32),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0.w,
              vertical: 16.0.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://media.istockphoto.com/id/1142192548/vector/man-avatar-profile-male-face-silhouette-or-icon-isolated-on-white-background-vector.jpg?s=2048x2048&w=is&k=20&c=lyki7QHyULuJNNheEf-BI_DQNCDi2NRYMfVGTQj_4UM='),
                    ),
                    horizontalSpace(16),
                    Text(
                      "${profileDataCached?.data?.user?.firstName} ${profileDataCached?.data?.user?.lastName}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                verticalSpace(32),
                ...List.generate(
                  2,
                  (index) {
                    return Skeletonizer(
                      enabled: true,
                      child: Padding(
                          padding: const EdgeInsets.only(bottom: 16.0).h,
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          )),
                    );
                  },
                ),
                verticalSpace(16),
                Text(
                  "project.data.description,",
                  style: AppStyles.font16BlackMedium,
                ),
                verticalSpace(8),
                Row(
                  children: [
                    RatingContainerItem(
                      icon: Icons.star,
                      ratingText: '4.5',
                      iconColor: Colors.yellow,
                    ),
                    horizontalSpace(8),
                    RatingContainerItem(
                      icon: Icons.remove_red_eye_outlined,
                      ratingText: '9k',
                      iconColor: Colors.black,
                    ),
                  ],
                ),
                if (!showMoreInfo)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showMoreInfo = true;
                      });
                    },
                    child: Column(
                      children: [
                        verticalSpace(16),
                        Text(
                          'View Project Information',
                          style: AppStyles.font16DarkBlueBold.copyWith(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                verticalSpace(16),
                if (showMoreInfo)
                  FadeInLeft(
                    animate: true,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Used Tools : \n',
                            style: AppStyles.font16DarkBlueBold.copyWith(
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(
                            text: '${"project.data.tools"}\n\n',
                            style: AppStyles.font16BlackMedium,
                          ),
                          TextSpan(
                            text: 'Start Date : \n',
                            style: AppStyles.font16DarkBlueBold.copyWith(
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(
                            text: 'project.data.startDate\n\n',
                            style: AppStyles.font16BlackMedium,
                          ),
                          TextSpan(
                            text: 'End Date : \n',
                            style: AppStyles.font16DarkBlueBold.copyWith(
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(
                            text: " project.data.endDate",
                            style: AppStyles.font16BlackMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                verticalSpace(32),
                Text(
                  'More Projects By ${profileDataCached?.data?.user?.firstName} ${profileDataCached?.data?.user?.lastName}',
                  style: AppStyles.font16BlackSemiBold,
                ),
                verticalSpace(16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 1 / 1,
                  ),
                  itemCount: projects?.data?.length,
                  itemBuilder: (context, index) {
                    return ProjectBodyGridViewItem(
                      projectData: projects?.data?[index],
                    );
                  },
                ),
                verticalSpace(16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
