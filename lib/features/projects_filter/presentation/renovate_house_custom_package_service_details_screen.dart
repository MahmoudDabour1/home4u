import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/project_details_app_bar.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/renovate_house_custom_package/renovate_house_custom_package_service_details_content.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/renovate_house_custom_package/renovate_house_custom_package_service_details_requests.dart';

import '../logic/renovate_house_custom_package/renovate_house_custom_package_services_cubit.dart';

class RenovateHouseCustomPackageServiceDetailsScreen extends StatefulWidget {
  final int requestId;

  const RenovateHouseCustomPackageServiceDetailsScreen({
    super.key,
    required this.requestId,
  });

  @override
  State<RenovateHouseCustomPackageServiceDetailsScreen> createState() =>
      _RenovateHouseCustomPackageServiceDetailsScreenState();
}

class _RenovateHouseCustomPackageServiceDetailsScreenState
    extends State<RenovateHouseCustomPackageServiceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProjectDetailsAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0.w,
              vertical: 16.0.h,
            ),
            child: Column(
              spacing: 32.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RenovateHouseCustomPackageServiceDetailsContent(),
                RenovateHouseCustomPackageServiceDetailsRequests(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    final cubit = context.read<RenovateHouseCustomPackageServicesCubit>();
    cubit
        .renovateHouseCustomPackageServiceDetails(
            packageId: widget.requestId.toString())
        .then((_) {
      cubit.getRenovateHouseCustomPackageRequests(
          requestId: widget.requestId.toString());
    });
  }
}
