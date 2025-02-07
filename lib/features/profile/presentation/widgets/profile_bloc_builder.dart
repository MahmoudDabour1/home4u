import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/profile/data/models/profile/profile_response_model.dart';
import 'package:home4u/features/profile/logic/profile/profile_cubit.dart';
import 'package:home4u/features/profile/logic/profile/profile_state.dart';
import 'package:home4u/features/profile/presentation/widgets/profile_data_shimmer.dart';
import 'package:home4u/features/profile/presentation/widgets/user_image_widget.dart';

import 'information_widget.dart';

class ProfileBlocBuilder extends StatelessWidget {
  const ProfileBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          current is LoadingProfileData ||
          current is SuccessProfileData ||
          current is ErrorProfileData,
      builder: (context, state) {
        final cubit =BlocProvider.of<ProfileCubit>(context);
        return state.maybeWhen(
          loadingProfileData: () => setupLoading(),
          successProfileData: (engineerData) =>
              setupSuccessWidget(engineerData,cubit),
          errorProfileData: (error) => setupError(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}

Widget setupSuccessWidget(ProfileResponseModel engineerData,cubit) {
  return Stack(
    children: [
      InformationWidget(
        profileData: engineerData,
      ),
      UserImageWidget(
        profileData: engineerData,
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
