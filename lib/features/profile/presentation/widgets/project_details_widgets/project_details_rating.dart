import 'package:flutter/material.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/profile/presentation/widgets/projects_widgets/rating_container_item.dart';

class ProjectDetailsRating extends StatelessWidget {
  const ProjectDetailsRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}