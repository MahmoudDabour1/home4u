import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/profile/data/models/profile/engineering_office_profile_response_model.dart';
import 'package:home4u/features/profile/logic/profile/profile_cubit.dart';
import 'package:home4u/features/profile/logic/profile/profile_state.dart';
import 'package:home4u/features/profile/presentation/widgets/profile_widgets/profile_custom_header_shape.dart';
import 'package:home4u/features/profile/presentation/widgets/profile_widgets/profile_data_shimmer.dart';
import 'package:home4u/features/profile/presentation/widgets/profile_widgets/user_image_widget.dart';

import '../../../data/models/profile/engineer_profile_response_model.dart';
import '../../../data/models/profile/technical_worker_profile_response_model.dart';
import 'information_widget.dart';

class ProfileBlocBuilder extends StatelessWidget {
  const ProfileBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          current is LoadingProfileData ||
          current is SuccessEngineerProfileData ||
          current is SuccessTechnicalWorkerProfileData ||
          current is SuccessEngineeringOfficeProfileData ||
          current is ErrorProfileData ||
          current is SuccessUpdateEngineerProfile ||
          current is SuccessUpdateTechnicalWorkerProfile,
      builder: (context, state) {
        final cubit = BlocProvider.of<ProfileCubit>(context);
        return state.maybeWhen(
          loadingProfileData: () => setupLoading(),
          successEngineerProfileData: (engineerData) =>
              setupSuccessWidget(engineerData, null, null, cubit),
          successTechnicalWorkerProfileData: (technicalWorkerData) =>
              setupSuccessWidget(null, technicalWorkerData, null, cubit),
          successEngineeringOfficeProfileData: (engineeringOfficeData) =>
              setupSuccessWidget(null, null, engineeringOfficeData, cubit),
          errorProfileData: (error) => setupError(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}

Widget setupSuccessWidget(
  EngineerProfileResponseModel? engineerData,
  TechnicalWorkerResponseModel? technicalWorkerData,
  EngineeringOfficeProfileResponseModel? engineeringOfficeData,
  cubit,
) {
  return Stack(
    children: [
      ProfileCustomHeaderShape(profileCachedData: engineeringOfficeData,),
      InformationWidget(
        engineerProfileResponseModel: engineerData,
        technicalWorkerProfileData: technicalWorkerData,
        engineeringOfficeProfileData: engineeringOfficeData,
      ),
      UserImageWidget(
        engineerProfileResponseModel: engineerData,
        technicalWorkerProfileData: technicalWorkerData,
        engineeringOfficeProfileData: engineeringOfficeData,
        cubit: cubit,
      ),
    ],
  );
}

Widget setupError() {
  return const SizedBox.shrink();
}

Widget setupLoading() {
  return ProfileDataShimmer();
}
