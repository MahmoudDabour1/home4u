import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home4u/features/projects_filter/logic/project_details/project_details_cubit.dart';
import 'package:home4u/features/projects_filter/presentation/project_details_app_bar.dart';
import 'package:home4u/features/projects_filter/presentation/widgets/ask_technical_worker_widgets/ask_technical_project_details_bloc_builder.dart';

class AskTechnicalProjectDetailsScreen extends StatefulWidget {
  final int askId;

  const AskTechnicalProjectDetailsScreen({super.key, required this.askId});

  @override
  State<AskTechnicalProjectDetailsScreen> createState() =>
      _AskTechnicalProjectDetailsScreenState();
}

class _AskTechnicalProjectDetailsScreenState
    extends State<AskTechnicalProjectDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<ProjectDetailsCubit>()
        .getAskTechnicalServiceDetails(widget.askId.toString());
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
            child: AskTechnicalProjectDetailsBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
