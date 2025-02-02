import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/profile/data/models/projects/get_projects_response_model.dart';
import 'package:home4u/features/profile/logic/profile/profile_cubit.dart';
import 'package:home4u/features/profile/logic/project/project_cubit.dart';

import '../../../../../core/routing/routes.dart';
import '../../../logic/profile/profile_state.dart';
import 'project_menu_button_and_dialog.dart';

class ProjectBodyGridViewItem extends StatelessWidget {
  final ProjectsData? projectData;

  const ProjectBodyGridViewItem({super.key, required this.projectData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            final projectCubit = BlocProvider.of<ProjectCubit>(context);
            projectCubit.getProjectById(projectData!.id!);
            context.pushNamed(
              Routes.projectDetailsScreen,
              arguments: projectData!.id,
            );
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: FancyShimmerImage(
                  imageUrl:
                      "https://dynamic-mouse-needlessly.ngrok-free.app/api/v1/file/download?fileName=${projectData!.coverPath}",
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  boxFit: BoxFit.fill,
                  shimmerBaseColor: Colors.grey[300]!,
                  shimmerHighlightColor: Colors.grey[100]!,
                  shimmerBackColor: Colors.grey[100]!,
                  errorWidget: const Center(child: Icon(Icons.error)),
                  alignment: Alignment.center,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16.r),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              ProjectMenuButtonAndDialog(
                projectData: projectData!,
              ),
            ],
          ),
        );
      },
    );
  }
}
