import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/profile/data/models/get_projects_response_model.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/project_bottom_rating_widget.dart';

import 'menu_button_and_dialog.dart';

class ProjectBodyGridViewItem extends StatelessWidget {
  final ProjectsData? projectData;
  const ProjectBodyGridViewItem({super.key, required this.projectData});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: CachedNetworkImage(
            imageUrl:
            "https://dynamic-mouse-needlessly.ngrok-free.app/api/v1/file/download?fileName=${projectData!.coverPath}"??"https://images.unsplash.com/photo-1640434037438-c3e8485687c2?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            width: MediaQuery.sizeOf(context).width*0.5,
            height:  MediaQuery.sizeOf(context).height*0.5,
            fit: BoxFit.fill,
            alignment: Alignment.center,
          ),
        ),
        MenuButtonAndDialog(projectId: projectData!.id??0,),
        ProjectBottomRatingWidget(),
      ],
    );
  }
}
