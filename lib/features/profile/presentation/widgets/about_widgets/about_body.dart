import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/profile/logic/profile/profile_cubit.dart';
import 'package:home4u/features/profile/logic/profile/profile_state.dart';

import '../../../data/models/profile/engineer_profile_response_model.dart';
import '../../../data/models/profile/engineering_office_profile_response_model.dart';
import '../../../data/models/profile/technical_worker_profile_response_model.dart';
import 'about_contact_info_widget.dart';
import 'about_profile_state_grid_view.dart';
import 'about_web_icons_widget.dart';

class AboutBody extends StatelessWidget {
  const AboutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
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

  Widget setupSuccessWidget(
    EngineerProfileResponseModel? engineerData,
    TechnicalWorkerResponseModel? technicalWorkerData,
    EngineeringOfficeProfileResponseModel? engineeringOfficeData,
    cubit,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AboutProfileStateGridView(),
          AboutContactInfoWidget(
            engineeringOfficeProfileData: engineeringOfficeData,
            technicalWorkerProfileData: technicalWorkerData,
            engineerProfileResponseModel: engineerData,
          ),
          AboutWebIconsWidget(
            engineeringOfficeProfileData: engineeringOfficeData,
            technicalWorkerProfileData: technicalWorkerData,
            engineerProfileResponseModel: engineerData,
          ),
        ],
      ),
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }

  Widget setupLoading() {
    return Center(child: CircularProgressIndicator());
  }
}
