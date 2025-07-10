import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:home4u/core/helpers/shared_pref_helper.dart';
import 'package:home4u/core/helpers/shared_pref_keys.dart';
import 'package:home4u/features/profile/data/models/profile/engineering_office_profile_response_model.dart';
import 'package:home4u/features/profile/data/models/profile/technical_worker_profile_response_model.dart';
import 'package:home4u/features/profile/data/models/projects/get_projects_response_model.dart';
import 'package:home4u/features/profile/logic/project/project_cubit.dart';
import 'package:home4u/features/profile/logic/project/project_state.dart';
import 'package:home4u/features/profile/presentation/widgets/project_details_widgets/project_details_content.dart';

import '../../../core/utils/app_constants.dart';
import '../data/models/profile/engineer_profile_response_model.dart';

class ProjectDetailsScreen extends StatefulWidget {
  final int projectId;

  const ProjectDetailsScreen({super.key, required this.projectId});

  @override
  _ProjectDetailsScreenState createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  bool showMoreInfo = false;
  dynamic profileData;
  GetProjectsResponseModel? projects;

  @override
  void initState() {
    super.initState();
    _initializeProfileData();
  }

  Future<void> _initializeProfileData() async {
    var engineerProfileBox =
        await Hive.openBox<EngineerProfileResponseModel>(kEngineerProfileBox);
    var technicalWorkerProfileBox =
        await Hive.openBox<TechnicalWorkerResponseModel>(
            kTechnicalWorkerProfileBox);
    var engineeringOfficeProfileBox =
        await Hive.openBox<EngineeringOfficeProfileResponseModel>(
            kEngineeringOfficeProfileBox);

    var projectBox = await Hive.openBox<GetProjectsResponseModel>(kProjectsBox);
    var projectsData = projectBox.get(kProjectsKey);
    projects = projectsData;

    final userType = await SharedPrefHelper.getString(SharedPrefKeys.userType);
    if (userType == 'ENGINEER') {
      profileData = engineerProfileBox.get(kEngineerProfileData);
    } else if (userType == "TECHNICAL_WORKER") {
      profileData = technicalWorkerProfileBox.get(kTechnicalWorkerProfileData);
    } else if (userType == "ENGINEERING_OFFICE") {
      profileData = engineeringOfficeProfileBox.get(kEngineeringOfficeProfileData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProjectCubit, ProjectState>(
          builder: (context, state) {
            return state.maybeWhen(
              getProjectLoading: () =>
                  Center(child: CircularProgressIndicator()),
              getProjectSuccess: (project) => ProjectDetailsContent(
                profileData: profileData,
                project: project,
                projects: projects,
                showMoreInfo: showMoreInfo,
                onShowMoreInfo: () {
                  setState(() {
                    showMoreInfo = true;
                  });
                },
              ),
              orElse: () => SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
