import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/networking/api_constants.dart';
import 'package:home4u/core/utils/spacing.dart';

class ProjectDetailsHeader extends StatelessWidget {
  final dynamic profileData;

  const ProjectDetailsHeader({super.key, required this.profileData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundImage: NetworkImage(
            profileData?.data?.user?.personalPhoto != null
                ? ApiConstants.getImageBaseUrl(
                    profileData?.data?.user?.personalPhoto)
                : 'https://cdn.vectorstock.com/i/1000v/23/81/default-avatar-profile-icon-vector-18942381.jpg',
          ),
        ),
        horizontalSpace(16),
        Text(
          "${profileData?.data?.user?.firstName ?? ''} ${profileData?.data?.user?.lastName ?? ''}",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
