import 'package:hive_flutter/hive_flutter.dart';
import 'package:home4u/features/products/data/models/products_response_model.dart';
import 'package:home4u/features/profile/data/models/profile/engineering_office_profile_response_model.dart' ;
import 'package:home4u/features/user/renovate_your_house/data/models/renovate_your_house_fixed_packages_model.dart';
import 'package:home4u/features/user/renovate_your_house/data/models/renovate_your_house_look_ups_model.dart';

import '../../features/profile/data/models/profile/engineer_profile_response_model.dart' ;
import '../../features/profile/data/models/profile/technical_worker_profile_response_model.dart' ;
import '../../features/profile/data/models/projects/get_projects_response_model.dart';
import 'app_constants.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  _registerHiveAdapters();
  await Hive.openBox<EngineerProfileResponseModel>(kEngineerProfileBox);
  await Hive.openBox<TechnicalWorkerResponseModel>(kTechnicalWorkerProfileBox);
  await Hive.openBox<EngineeringOfficeProfileResponseModel>(kEngineeringOfficeProfileBox);
  await Hive.openBox<GetProjectsResponseModel>(kProjectsBox);
  await Hive.openBox<ProductsResponseModel>(kProductsBox);
  await Hive.openBox<RenovateYourHouseLookUpsModel>(kRenovateYourHouseLookUpsBox);
  await Hive.openBox<RenovateYourHouseFixedPackagesModel>(kRenovateYourHouseFixedPackagesBox);
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
    Hive.registerAdapter(ProductDataAdapter());
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
  if (!Hive.isAdapterRegistered(90)) {
    Hive.registerAdapter(EngineeringOfficeProfileResponseModelAdapter());
  }
  if (!Hive.isAdapterRegistered(91)) {
    Hive.registerAdapter(EngineeringOfficeDataAdapter());
  }
  if (!Hive.isAdapterRegistered(92)) {
    Hive.registerAdapter(EngineeringOfficeAdapter());
  }
  if (!Hive.isAdapterRegistered(93)) {
    Hive.registerAdapter(EngineeringOfficeUserAdapter());
  }
  if (!Hive.isAdapterRegistered(94)) {
    Hive.registerAdapter(EngineeringOfficeCityAdapter());
  }
  if (!Hive.isAdapterRegistered(95)) {
    Hive.registerAdapter(RenovateYourHouseLookUpsModelAdapter());
  }
  if (!Hive.isAdapterRegistered(96)) {
    Hive.registerAdapter(DataAdapter());
  }
  if (!Hive.isAdapterRegistered(97)) {
    Hive.registerAdapter(GovernorateAdapter());
  }
  if (!Hive.isAdapterRegistered(98)) {
    Hive.registerAdapter(UnitStatusAdapter());
  }
  if (!Hive.isAdapterRegistered(99)) {
    Hive.registerAdapter(RenovateYourHouseFixedPackagesModelAdapter());
  }
  if (!Hive.isAdapterRegistered(100)) {
    Hive.registerAdapter(FixedPackageDataModelAdapter());
  }
}