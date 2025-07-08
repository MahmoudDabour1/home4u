import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/project_details_app_bar.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/renovate_house_widgets/renovate_house_service_details_content.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/renovate_house_widgets/renovate_house_service_details_requests.dart';

import '../logic/renovate_house/renovate_house_services_cubit.dart';

class RenovateHouseServiceDetailsScreen extends StatefulWidget {
  final int requestId;

  const RenovateHouseServiceDetailsScreen({super.key, required this.requestId});

  @override
  State<RenovateHouseServiceDetailsScreen> createState() =>
      _RenovateHouseServiceDetailsScreenState();
}

class _RenovateHouseServiceDetailsScreenState
    extends State<RenovateHouseServiceDetailsScreen> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<RenovateHouseServicesCubit>();
    cubit.renovateHouseServiceDetails(
      requestId: widget.requestId.toString(),
    );
    cubit.getRenovateHouseServiceRequests(
      requestId: widget.requestId.toString(),
    );
  }

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
                RenovateHouseServiceDetailsContent(),
                RenovateHouseServiceDetailsRequests(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
