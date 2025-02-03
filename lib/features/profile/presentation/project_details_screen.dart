import 'package:animate_do/animate_do.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/networking/api_constants.dart';
import 'package:home4u/core/theming/app_styles.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/profile/logic/project/project_cubit.dart';
import 'package:home4u/features/profile/logic/project/project_state.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/get_projects_bloc_builder.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/projects_details_shimmer_widget.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/rating_container_item.dart';

import '../../../core/utils/app_constants.dart';
import '../../auth/widgets/auth_welcome_data.dart';

class ProjectDetailsScreen extends StatefulWidget {
  final int projectId;

  const ProjectDetailsScreen({super.key, required this.projectId});

  @override
  _ProjectDetailsScreenState createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  bool showMoreInfo = false;

  @override
  void initState() {
    context.read<ProjectCubit>().getProjects();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProjectCubit, ProjectState>(
          builder: (context, state) {
            return state.maybeWhen(
              getProjectLoading: ()=> ProjectsDetailsShimmerWidget(),
              getProjectSuccess: (project) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AuthWelcomeData(
                        headText: project.data.name,
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
                                  'Mahmoud Dabour',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            verticalSpace(32),
                            ...List.generate(
                              project.data.images!.length,
                              (index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 16.0).h,
                                  child: FancyShimmerImage(
                                    imageUrl: ApiConstants.getImageBaseUrl(
                                      project.data.images![index].path,
                                    ),
                                    width: MediaQuery.sizeOf(context).width,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.2,
                                    boxFit: BoxFit.fill,
                                    shimmerBaseColor: Colors.grey[300]!,
                                    shimmerHighlightColor: Colors.grey[100]!,
                                    shimmerBackColor: Colors.grey[100]!,
                                    errorWidget:
                                        const Center(child: Icon(Icons.error)),
                                    alignment: Alignment.center,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            verticalSpace(16),
                            Text(
                              project.data.description,
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
                                      style:
                                          AppStyles.font16DarkBlueBold.copyWith(
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
                                        style: AppStyles.font16DarkBlueBold
                                            .copyWith(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '${project.data.tools}\n\n',
                                        style: AppStyles.font16BlackMedium,
                                      ),
                                      TextSpan(
                                        text: 'Start Date : \n',
                                        style: AppStyles.font16DarkBlueBold
                                            .copyWith(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            '${formatDate(project.data.startDate)}\n\n',
                                        style: AppStyles.font16BlackMedium,
                                      ),
                                      TextSpan(
                                        text: 'End Date : \n',
                                        style: AppStyles.font16DarkBlueBold
                                            .copyWith(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      TextSpan(
                                        text: formatDate(project.data.endDate),
                                        style: AppStyles.font16BlackMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            verticalSpace(32),
                            Text(
                              'More Projects By Mahmoud Dabour',
                              style: AppStyles.font16BlackSemiBold,
                            ),
                            verticalSpace(16),
                            // GetProjectsBlocBuilder(),
                            // verticalSpace(16),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              orElse: () {
                return SizedBox.shrink();
              },
            );
          },
        ),
      ),
    );
  }
}
