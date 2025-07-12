import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/logic/ask_engineer/ask_engineer_services_cubit.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/ask_engineer_widgets/ask_engineer_service_asks_details.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/ask_engineer_widgets/ask_engineer_service_content_details.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/project_details_app_bar.dart';

class AskEngineerServiceDetailsScreen extends StatefulWidget {
  final int askId;

  const AskEngineerServiceDetailsScreen({
    super.key,
    required this.askId,
  });

  @override
  State<AskEngineerServiceDetailsScreen> createState() =>
      _AskEngineerServiceDetailsScreenState();
}

class _AskEngineerServiceDetailsScreenState
    extends State<AskEngineerServiceDetailsScreen> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<AskEngineerServicesCubit>();
    cubit.askEngineerServiceDetails(askId: widget.askId.toString()).then((_) {
      cubit.getAskEngineerRequests(askId: widget.askId.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProjectDetailsAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 16.h,
            ),
            child: Column(
              spacing: 32.h,
              children: [
                AskEngineerServiceContentDetails(),
                AskEngineerServiceAsksDetails(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
