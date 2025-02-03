import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/rating_container_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../auth/widgets/auth_welcome_data.dart';

class ProjectsDetailsShimmerWidget extends StatelessWidget {
  const ProjectsDetailsShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Skeletonizer(
          enabled: true,
          child: AuthWelcomeData(
            headText: "data.name",
            subText: '',
          ),
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
              Row(
                children: [
                  Skeletonizer(
                    enabled: true,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://media.istockphoto.com/id/1142192548/vector/man-avatar-profile-male-face-silhouette-or-icon-isolated-on-white-background-vector.jpg?s=2048x2048&w=is&k=20&c=lyki7QHyULuJNNheEf-BI_DQNCDi2NRYMfVGTQj_4UM='),
                    ),
                  ),
                  horizontalSpace(16),
                  Skeletonizer(
                    enabled: true,
                    child: Text(
                      'Mahmoud Dabour',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              verticalSpace(32),
              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Skeletonizer(
                  enabled: true,
                  child: Column(
                    children: [
                      verticalSpace(10),
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(16),
              Skeletonizer(
                enabled: true,
                child: Text(
                  "description",
                  style: AppStyles.font16BlackMedium,
                ),
              ),
              verticalSpace(8),
              Row(
                children: [
                  Skeletonizer(
                    enabled: true,
                    child: RatingContainerItem(
                      icon: Icons.star,
                      ratingText: '4.5',
                      iconColor: Colors.yellow,
                    ),
                  ),
                  horizontalSpace(8),
                  Skeletonizer(
                    enabled: true,
                    child: RatingContainerItem(
                      icon: Icons.remove_red_eye_outlined,
                      ratingText: '9k',
                      iconColor: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  verticalSpace(16),
                  Skeletonizer(
                    enabled: true,
                    child: Text(
                      'View Project Information',
                      style: AppStyles.font16DarkBlueBold.copyWith(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(32),
              Skeletonizer(
                enabled: true,
                child: Text(
                  'More Projects By Mahmoud Dabour',
                  style: AppStyles.font16BlackSemiBold,
                ),
              ),
              verticalSpace(16),
              // GetProjectsBlocBuilder(),
              // verticalSpace(16),
            ],
          ),
        ),
      ],
    );
  }
}
