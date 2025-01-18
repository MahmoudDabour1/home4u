import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/profile/data/models/get_projects_response_model.dart';
import 'package:home4u/features/profile/logic/profile_cubit.dart';
import 'package:home4u/features/profile/logic/profile_state.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/project_bottom_rating_widget.dart';
import 'menu_button_and_dialog.dart';

class ProjectBodyGridViewItem extends StatelessWidget {
  final ProjectsData? projectData;

  const ProjectBodyGridViewItem({super.key, required this.projectData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: FancyShimmerImage(
                imageUrl:
                "https://dynamic-mouse-needlessly.ngrok-free.app/api/v1/file/download?fileName=${projectData!.coverPath}" ??
                    "https://images.unsplash.com/photo-1640434037438-c3e8485687c2?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
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
            MenuButtonAndDialog(
              projectId: projectData!.id ?? 0,
            ),
            ProjectBottomRatingWidget(),
          ],
        );
      },
    );
  }
}