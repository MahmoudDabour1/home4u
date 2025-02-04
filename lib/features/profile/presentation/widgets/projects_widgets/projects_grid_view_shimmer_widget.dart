import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProjectsGridViewShimmerWidget extends StatelessWidget {
  final bool isCertification;

  const ProjectsGridViewShimmerWidget(
      {super.key, this.isCertification = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
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
                        imageUrl: '',
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
                      ),
                    ),
                    // Skeletonizer(
                    //   enabled: true,
                    //   child: ProjectMenuButtonAndDialog(
                    //      projectData: ProjectsData(),
                    //   ),
                    // ),
                    // isCertification
                    //     ? SizedBox.shrink()
                    //     : ProjectBottomRatingWidget(),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
