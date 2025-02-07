import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:home4u/features/profile/data/models/certifications/get_certifications_response_model.dart';
import 'package:home4u/features/profile/logic/certifications/certifications_cubit.dart';
import 'package:home4u/features/profile/presentation/widgets/certifications_widgets/add_certifications_info.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../locale/app_locale.dart';
import '../../auth/widgets/auth_welcome_data.dart';
import '../logic/certifications/certifications_state.dart';

class AddCertificationScreen extends StatelessWidget {
  final CertificationsData? certificationsData;

  const AddCertificationScreen({super.key, this.certificationsData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => sl<CertificationsCubit>(),
            child: BlocBuilder<CertificationsCubit, CertificationsState>(
              builder: (context, state) {
                return Column(
                  children: [
                    AuthWelcomeData(
                      headText: certificationsData != null
                          ? AppLocale.update.getString(context)
                          : AppLocale.addCertification.getString(context),
                      subText: '',
                    ),
                    AddCertificationsInfo(
                      certificationData: certificationsData,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
