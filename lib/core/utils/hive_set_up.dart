import 'package:hive_flutter/hive_flutter.dart';
import 'package:home4u/features/products/data/models/products_response_model.dart';

import '../../features/profile/data/models/profile/engineer_profile_response_model.dart';
import '../../features/profile/data/models/profile/technical_worker_profile_response_model.dart';
import '../../features/profile/data/models/projects/get_projects_response_model.dart';
import 'app_constants.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  _registerHiveAdapters();
  await Hive.openBox<EngineerProfileResponseModel>(kEngineerProfileBox);
  await Hive.openBox<TechnicalWorkerResponseModel>(kTechnicalWorkerProfileBox);
  await Hive.openBox<GetProjectsResponseModel>(kProjectsBox);
  await Hive.openBox<ProductsResponseModel>(kProductsBox);
}

void _registerHiveAdapters() {
  // Register Hive Adapters
  if (!Hive.isAdapterRegistered(70)) {
    Hive.registerAdapter(EngineerProfileResponseModelAdapter());
  }
  if (!Hive.isAdapterRegistered(71)) {
    Hive.registerAdapter(FreeLancerDataAdapter());
  }
  if (!Hive.isAdapterRegistered(72)) {
    Hive.registerAdapter(FreeLancerTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(73)) {
    Hive.registerAdapter(FreeLancerUserAdapter());
  }
  if (!Hive.isAdapterRegistered(74)) {
    Hive.registerAdapter(FreeLancerCityAdapter());
  }
  if (!Hive.isAdapterRegistered(75)) {
    Hive.registerAdapter(TechnicalWorkerResponseModelAdapter());
  }
  if (!Hive.isAdapterRegistered(76)) {
    Hive.registerAdapter(TechnicalDataAdapter());
  }
  if (!Hive.isAdapterRegistered(10)) {
    Hive.registerAdapter(GetProjectsResponseModelAdapter());
  }
  if (!Hive.isAdapterRegistered(11)) {
    Hive.registerAdapter(ProjectsDataAdapter());
  }
  if (!Hive.isAdapterRegistered(80)) {
    Hive.registerAdapter(ProductsResponseModelAdapter());
  }
  if (!Hive.isAdapterRegistered(81)) {
    Hive.registerAdapter(DataAdapter());
  }
  if (!Hive.isAdapterRegistered(82)) {
    Hive.registerAdapter(ContentAdapter());
  }
  if (!Hive.isAdapterRegistered(83)) {
    Hive.registerAdapter(ColorAdapter());
  }
  if (!Hive.isAdapterRegistered(84)) {
    Hive.registerAdapter(PageableAdapter());
  }
  if (!Hive.isAdapterRegistered(85)) {
    Hive.registerAdapter(SortAdapter());
  }
}