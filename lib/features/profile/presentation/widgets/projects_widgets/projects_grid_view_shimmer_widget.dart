import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/profile/data/models/projects/get_projects_response_model.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/project_bottom_rating_widget.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/project_menu_button_and_dialog.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProjectsGridViewShimmerWidget extends StatelessWidget {
  final bool isCertification;

  const ProjectsGridViewShimmerWidget(
      {super.key, this.isCertification = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 1 / 1,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Skeletonizer(
            enabled: true,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: FancyShimmerImage(
                    imageUrl:
                        "https://images.unsplash.com/photo-1640434037438-c3e8485687c2?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    boxFit: BoxFit.fill,
                    shimmerBaseColor: Colors.grey[300]!,
                    shimmerHighlightColor: Colors.grey[100]!,
                    shimmerBackColor: Colors.grey[100]!,
                    errorWidget: Center(child: const Icon(Icons.error)),
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
                    // errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                // Skeletonizer(
                //   enabled: true,
                //   child: ProjectMenuButtonAndDialog(
                //      projectData: ProjectsData(),
                //   ),
                // ),
                isCertification
                    ? SizedBox.shrink()
                    : ProjectBottomRatingWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
