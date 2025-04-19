import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/core/utils/spacing.dart';
import 'package:home4u/features/profile/data/models/profile/engineer_profile_response_model.dart';
import 'package:home4u/features/profile/data/models/profile/engineering_office_profile_response_model.dart';
import 'package:home4u/features/profile/data/models/profile/technical_worker_profile_response_model.dart';
import 'package:home4u/features/profile/presentation/widgets/profile_widgets/profile_rating_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/routing/router_observer.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_custom_button.dart';
import '../../../../../locale/app_locale.dart';
import '../../../logic/profile/profile_cubit.dart';
import '../../../logic/profile/profile_state.dart';

class InformationWidget extends StatelessWidget {
  final EngineerProfileResponseModel? engineerProfileResponseModel;
  final TechnicalWorkerResponseModel? technicalWorkerProfileData;
  final EngineeringOfficeProfileResponseModel? engineeringOfficeProfileData;

  const InformationWidget({
    super.key,
    this.engineerProfileResponseModel,
    this.technicalWorkerProfileData,
    this.engineeringOfficeProfileData,
  });

  @override
  Widget build(BuildContext context) {
    final profileData = engineerProfileResponseModel?.data ??
        technicalWorkerProfileData?.data ??
        engineeringOfficeProfileData?.data;

    logger.d("${engineeringOfficeProfileData?.data?.description}");
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Column(
            children: [
              verticalSpace(200),
              Skeletonizer(
                enabled: state is LoadingProfileData,
                child: Text(
                  engineeringOfficeProfileData?.data == null
                      ? "${(profileData as dynamic)?.user?.firstName} ${(profileData as dynamic)?.user?.lastName}"
                      : "${(profileData as dynamic)?.name}" ?? "",
                  style: AppStyles.font16BlackSemiBold,
                ),
              ),
              verticalSpace(8),
              Skeletonizer(
                enabled: state is LoadingProfileData,
                child: Text(
                  engineeringOfficeProfileData?.data == null
                      ? (profileData as dynamic)?.type?.name
                      : (profileData as dynamic)
                              ?.engineeringOfficeField
                              ?.name ??
                          "" ??
                          "",
                  style: AppStyles.font16BlackLight,
                ),
              ),
              verticalSpace(8),
              ProfileRatingWidget(),
              verticalSpace(8),
              Skeletonizer(
                enabled: state is LoadingProfileData,
                child: Text(
                  engineeringOfficeProfileData?.data != null
                      ? (profileData as dynamic)?.description ?? ""
                      : (profileData as dynamic)?.bio ?? "",
                  style: AppStyles.font16BlackLight,
                  textAlign: TextAlign.center,
                ),
              ),
              verticalSpace(8),
              AppCustomButton(
                textButton: AppLocale.editProfile.getString(context),
                btnWidth: 200.w,
                btnHeight: 30.h,
                onPressed: () {
                  context.pushNamed(Routes.editProfileScreen);
                },
                radius: 25,
              ),
              verticalSpace(16),
            ],
          );
        },
      ),
    );
  }
}
