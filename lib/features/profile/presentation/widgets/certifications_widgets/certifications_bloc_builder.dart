import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/profile/logic/certifications/certifications_cubit.dart';
import 'package:home4u/features/profile/logic/certifications/certifications_state.dart';
import 'package:home4u/features/profile/presentation/widgets/certifications_widgets/certifications_grid_view.dart';

import '../projects_widgets/projects_grid_view_shimmer_widget.dart';

class CertificationsBlocBuilder extends StatelessWidget {
  const CertificationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CertificationsCubit, CertificationsState>(
      buildWhen: (previous, current) =>
          current is CertificationsLoadingState ||
          current is CertificationsSuccessState ||
          current is CertificationsFailureState ||
          current is AddCertificationLoading ||
          current is AddCertificationError ||
          current is AddCertificationSuccess ||
          current is UpdateCertificationLoading ||
          current is UpdateCertificationError ||
          current is UpdateCertificationSuccess,
      builder: (context, state) {
        return state.maybeWhen(
          getAllCertificationsLoading: () => setupLoading(),
          getAllCertificationsSuccess: (certifications) {
            return setupSuccessWidget(certifications);
          },
          getAllCertificationsFailure: (errorHandler) => setupError(),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupSuccessWidget(certifications) {
    return CertificationsGridView(certificationsList: certifications ?? []);
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }

  Widget setupLoading() {
    return ProjectsGridViewShimmerWidget(
      isCertification: true,
    );
  }
}
