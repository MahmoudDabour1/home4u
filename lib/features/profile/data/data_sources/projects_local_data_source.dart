import 'package:hive/hive.dart';
import 'package:home4u/core/utils/app_constants.dart';
import '../../../../core/routing/router_observer.dart';
import '../models/projects/get_projects_response_model.dart';

abstract class ProjectsLocalDataSource {
  GetProjectsResponseModel? getCachedProjects();

  Future<void> cacheProjects(GetProjectsResponseModel projects);
}

class ProjectsLocalDataSourceImpl implements ProjectsLocalDataSource {
  Box<GetProjectsResponseModel> projectsBox =
      Hive.box<GetProjectsResponseModel>(kProjectsBox);

  @override
  GetProjectsResponseModel? getCachedProjects() {
    return projectsBox.get(kProjectsKey);
  }

  @override
  Future<void> cacheProjects(GetProjectsResponseModel projects) async {
    await projectsBox.put(kProjectsKey, projects);
    logger.w('Projects data cached successfully');
  }
}
