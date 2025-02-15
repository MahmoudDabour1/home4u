import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/routing/router_observer.dart';
import 'package:home4u/features/profile/logic/profile/profile_cubit.dart';
import 'package:home4u/features/profile/logic/profile/profile_state.dart';
import 'package:home4u/features/profile/presentation/widgets/profile_data_shimmer.dart';
import 'package:home4u/features/profile/presentation/widgets/user_image_widget.dart';

import '../../data/models/profile/engineer_profile_response_model.dart';
import '../../data/models/profile/technical_worker_profile_response_model.dart';
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
          current is ErrorProfileData ||
          current is SuccessUpdateEngineerProfile ||
          current is SuccessUpdateTechnicalWorkerProfile,
      builder: (context, state) {
        print("State: $state"); // Debug print
        final cubit = BlocProvider.of<ProfileCubit>(context);
        return state.maybeWhen(
          loadingProfileData: () => setupLoading(),
          successEngineerProfileData: (engineerData) =>
              setupSuccessWidget(engineerData, null, cubit),
          successTechnicalWorkerProfileData: (technicalWorkerData) =>
              setupSuccessWidget(null, technicalWorkerData, cubit),
          successUpdateEngineerProfile: (engineerData) =>
              setupSuccessWidget(engineerData, null, cubit),
          successUpdateTechnicalWorkerProfile: (technicalWorkerData) =>
              setupSuccessWidget(null, technicalWorkerData, cubit),
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
  cubit,
) {
  logger.w("Engineer Data: $engineerData"); // Debug print
  logger.w("Technical Worker Data: $technicalWorkerData"); // Debug print

  // Ensure that the data is not null before accessing its properties
  if (engineerData != null) {
    logger.i("Engineer Data: ${engineerData.data}"); // Debug print
  }

  if (technicalWorkerData != null) {
    logger
        .i("Technical Worker Data: ${technicalWorkerData.data}"); // Debug print
  }
  return Stack(
    children: [
      InformationWidget(
        engineerProfileResponseModel: engineerData,
        technicalWorkerProfileData: technicalWorkerData,
      ),
      UserImageWidget(
        engineerProfileResponseModel: engineerData,
        technicalWorkerProfileData: technicalWorkerData,
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
