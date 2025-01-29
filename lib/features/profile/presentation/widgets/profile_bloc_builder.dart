import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/profile/data/models/profile/get_engineer_response_model.dart';
import 'package:home4u/features/profile/logic/profile/profile_cubit.dart';
import 'package:home4u/features/profile/logic/profile/profile_state.dart';
import 'package:home4u/features/profile/presentation/widgets/profile_data_shimmer.dart';
import 'package:home4u/features/profile/presentation/widgets/user_image_widget.dart';

import 'information_widget.dart';

class ProfileBlocBuilder extends StatelessWidget {
  const ProfileBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit,ProfileState>(
        buildWhen: (previous, current) =>
            current is LoadingProfileData ||
            current is SuccessProfileData,
            // current is ErrorProfileData,
        builder: (context, state) {
      return state.maybeWhen(
          loadingProfileData: () => ProfileDataShimmer(),
          successProfileData: (engineerData) {
            return setupSuccessWidget(engineerData);
          },
          orElse:(){
        return const SizedBox.shrink();
      } );
    });
  }
}

Widget setupSuccessWidget(GetEngineerResponseModel engineerData) {
  return Stack(
    children: [
      InformationWidget(
        engineerData:engineerData ,
      ),
      UserImageWidget(
        engineerResponseModel: engineerData,
      ),
    ],
  );
}
Widget setupError() {
  return const SizedBox.shrink();
}
