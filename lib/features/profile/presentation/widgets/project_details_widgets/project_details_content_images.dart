import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/networking/api_constants.dart';
import 'package:home4u/core/widgets/fancy_image.dart';

import '../../../data/models/projects/project_response.dart';

class ProjectDetailsContentImages extends StatelessWidget {
  final ProjectResponse project;

  const ProjectDetailsContentImages({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        project.data.images?.length ?? 0,
        (index) {
          final imageUrl = ApiConstants.getImageBaseUrl(
            project.data.images?[index].path ?? '',
          );
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0).h,
            child: imageUrl.isNotEmpty
                ? FancyImage(
                    imagePath: imageUrl,
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * 0.2,
                  )
                : const Center(child: Icon(Icons.error)),
          );
        },
      ),
    );
  }
}
