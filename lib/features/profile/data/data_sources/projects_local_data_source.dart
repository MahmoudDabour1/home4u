// import 'package:hive/hive.dart';
// import 'package:home4u/core/utils/app_constants.dart';
// import '../models/projects/get_projects_response_model.dart';
//
// abstract class ProjectsLocalDataSource {
//   GetProjectsResponseModel? getCachedProjects();
//   Future<void> cacheProjects(GetProjectsResponseModel projects);
// }
//
// class ProjectsLocalDataSourceImpl implements ProjectsLocalDataSource {
//   @override
//   GetProjectsResponseModel? getCachedProjects() {
//     Box<GetProjectsResponseModel> projectsBox = Hive.box<GetProjectsResponseModel>(kProjectsBox);
//     return projectsBox.get(kProjectsKey);
//   }
//
//   @override
//   Future<void> cacheProjects(GetProjectsResponseModel projects) async {
//     Box<GetProjectsResponseModel> projectsBox = Hive.box<GetProjectsResponseModel>(kProjectsBox);
//     await projectsBox.put(kProjectsKey, projects);
//   }
// }