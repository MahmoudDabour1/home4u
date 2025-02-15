import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/auth/login/logic/login_cubit.dart';
import 'package:home4u/features/auth/login/logic/login_state.dart';
import 'package:home4u/features/profile/logic/profile/profile_cubit.dart';
import 'package:home4u/features/profile/logic/profile/profile_state.dart';
import 'package:home4u/features/profile/presentation/widgets/edit_engineer_profile_inputs.dart';
import 'package:home4u/features/profile/presentation/widgets/edit_technical_worker_profile_inputs.dart';

import '../../../locale/app_locale.dart';
import '../../auth/widgets/auth_welcome_data.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AuthWelcomeData(
                    headText: AppLocale.updateYourProfile.getString(context),
                    subText: '',
                  ),
                  state.maybeWhen(
                    orElse: () {
                      return const SizedBox.shrink();
                    },
                    loadingUpdateProfile: () {
                      return Center(
                        child: const CircularProgressIndicator(),
                      );
                    },
                    successEngineerProfileData: (_) {
                      return EditEngineerProfileInputs();
                    },
                    successTechnicalWorkerProfileData: (_) {
                      return EditTechnicalWorkerProfileInputs();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
