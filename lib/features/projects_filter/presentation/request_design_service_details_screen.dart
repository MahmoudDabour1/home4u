import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/logic/request_design/request_design_services_cubit.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/project_details_app_bar.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/request_design_widgets/request_design_service_details_content.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/request_design_widgets/request_design_service_details_requests.dart';

class RequestDesignServiceDetailsScreen extends StatefulWidget {
  final int requestId;

  const RequestDesignServiceDetailsScreen({super.key, required this.requestId});

  @override
  State<RequestDesignServiceDetailsScreen> createState() =>
      _RequestDesignServiceDetailsScreenState();
}

class _RequestDesignServiceDetailsScreenState
    extends State<RequestDesignServiceDetailsScreen> {
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
                RequestDesignServiceDetailsContent(),
                RequestDesignServiceDetailsRequests(),
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
    final cubit = context.read<RequestDesignServicesCubit>();
    cubit
        .requestDesignDetails(requestId: widget.requestId.toString())
        .then((_) {
      cubit.getAskRequestDesignRequests(askId: widget.requestId.toString());
    });
  }
}
