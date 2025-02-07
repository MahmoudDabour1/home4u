import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/networking/api_constants.dart';
import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/core/theming/app_colors.dart';
import 'package:home4u/features/profile/data/models/profile/profile_response_model.dart';

import '../../../../core/widgets/bottom_model.dart';
import '../../logic/profile/profile_cubit.dart';
import '../../logic/profile/profile_state.dart';

class UserImageWidget extends StatelessWidget {
  final ProfileResponseModel? profileData;
  final ProfileCubit cubit;

  const UserImageWidget(
      {super.key, required this.profileData, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70.h,
      left: MediaQuery
          .sizeOf(context)
          .width / 2 - 51.w,
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 150.h,
                    child: BottomModel(cubit: cubit, isCoverImage: false),
                  );
                },
              );
            },
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      child: CircleAvatar(
                        radius: 51.r,
                        foregroundImage:
                        profileData?.data?.user?.personalPhoto != null
                            ? NetworkImage(
                          ApiConstants.getImageBaseUrl(
                            profileData!.data!.user!.personalPhoto,
                          ),
                        )
                            : AssetImage(
                          AppAssets.facebook,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0.w,
                      bottom: 0.h,
                      child: Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(50.r),
                          shape: BoxShape.circle,
                          color: AppColors.blackColor,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: AppColors.whiteColor,
                          size: 25.r,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
