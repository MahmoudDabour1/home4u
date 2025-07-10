import 'package:hive_flutter/hive_flutter.dart';
import 'package:home4u/features/profile/data/models/profile/engineer_profile_response_model.dart';
import 'package:home4u/features/profile/data/models/profile/engineering_office_profile_response_model.dart';
import 'package:home4u/features/profile/data/models/profile/technical_worker_profile_response_model.dart';

import '../../../../core/utils/app_constants.dart';

abstract class ProfileLocalDataSource {
  Future<EngineerProfileResponseModel?> getEngineerProfileData();

  Future<TechnicalWorkerResponseModel?> getTechnicalWorkerProfileData();

  Future<EngineeringOfficeProfileResponseModel?>
      getEngineeringOfficeProfileData();

  Future<void> cacheEngineerProfileData(
      EngineerProfileResponseModel profileData);

  Future<void> cacheTechnicalWorkerProfileData(
      TechnicalWorkerResponseModel profileData);

  Future<void> cacheEngineeringOfficeProfileData(
      EngineeringOfficeProfileResponseModel profileData);
}

class ProfileLocalDataSourceImpl extends ProfileLocalDataSource {
  final Box<EngineerProfileResponseModel> engineerProfileBox =
      Hive.box<EngineerProfileResponseModel>(kEngineerProfileBox);
  final Box<TechnicalWorkerResponseModel> technicalWorkerProfileBox =
      Hive.box<TechnicalWorkerResponseModel>(kTechnicalWorkerProfileBox);
  final Box<EngineeringOfficeProfileResponseModel> engineeringOfficeProfileBox =
      Hive.box<EngineeringOfficeProfileResponseModel>(
          kEngineeringOfficeProfileBox);

  @override
  Future<void> cacheEngineerProfileData(
      EngineerProfileResponseModel profileData) async {
    await engineerProfileBox.put(kEngineerProfileData, profileData);
  }

  @override
  Future<void> cacheTechnicalWorkerProfileData(
      TechnicalWorkerResponseModel profileData) async {
    await technicalWorkerProfileBox.put(
        kTechnicalWorkerProfileData, profileData);
  }
  @override
  Future<void> cacheEngineeringOfficeProfileData(
      EngineeringOfficeProfileResponseModel profileData) async {
    await engineeringOfficeProfileBox.put(
        kEngineeringOfficeProfileData, profileData);
  }


  @override
  Future<EngineerProfileResponseModel?> getEngineerProfileData() async {
    return engineerProfileBox.get(kEngineerProfileData);
  }

  @override
  Future<TechnicalWorkerResponseModel?> getTechnicalWorkerProfileData() async {
    return technicalWorkerProfileBox.get(kTechnicalWorkerProfileData);
  }



  @override
  Future<EngineeringOfficeProfileResponseModel?>
      getEngineeringOfficeProfileData() async {
    return engineeringOfficeProfileBox.get(kEngineeringOfficeProfileData);
  }
}
