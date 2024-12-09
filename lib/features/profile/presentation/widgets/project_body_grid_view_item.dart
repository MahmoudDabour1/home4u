import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/features/profile/presentation/widgets/rating_container_item.dart';
import '../../../../core/utils/spacing.dart';

class ProjectBodyGridViewItem extends StatelessWidget {
  const ProjectBodyGridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: CachedNetworkImage(
            imageUrl: "https://images.unsplash.com/photo-1640434037438-c3e8485687c2?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            width: 164.w,
            height: 164.h,
            fit: BoxFit.fill,
            alignment: Alignment.center,
          ),
        ),
        IconButton(
            onPressed:() {},
            icon: Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset(
                "assets/svgs/menu_svg.svg",
                width: 24.w,
                height: 24.h,
              ),
            )),
        Positioned(
          bottom: 8.h,
          right: 8.w,
          child: Row(
            children: [
              RatingContainerItem(
                ratingText: "9k",
                icon: Icons.star,
              ),
              horizontalSpace(8),
              RatingContainerItem(
                ratingText: "9k",
                icon: Icons.visibility_outlined,
                iconColor: AppColors.secondaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
