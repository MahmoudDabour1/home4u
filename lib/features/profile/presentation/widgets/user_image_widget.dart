import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/features/profile/data/models/profile/get_engineer_response_model.dart';

class UserImageWidget extends StatelessWidget {
  final GetEngineerResponseModel engineerResponseModel;

  const UserImageWidget({super.key, required this.engineerResponseModel});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70.h,
      left: MediaQuery.sizeOf(context).width / 2 - 51.w,
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        child: CircleAvatar(
          radius: 51.r,
          foregroundImage: engineerResponseModel.data!.user!.personalPhoto !=
                  null
              ? NetworkImage(
                  "https://dynamic-mouse-needlessly.ngrok-free.app/api/v1/file/download?fileName=${engineerResponseModel.data!.user!.personalPhoto}")
              : AssetImage(AppAssets.facebook),
        ),
      ),
    );
  }
}
