import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/networking/api_constants.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/features/profile/data/models/profile/profile_response_model.dart';

class UserImageWidget extends StatelessWidget {
  final ProfileResponseModel profileData;

  const UserImageWidget({super.key, required this.profileData});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70.h,
      left: MediaQuery.sizeOf(context).width / 2 - 51.w,
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        child: CircleAvatar(
          radius: 51.r,
          foregroundImage: profileData.data!.user!.personalPhoto != null
              ? NetworkImage(
                  "${ApiConstants.getImageBaseUrl}${profileData.data!.user!.personalPhoto}")
              : AssetImage(AppAssets.facebook,),
        ),
      ),
    );
  }
}
