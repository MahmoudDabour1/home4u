import 'package:hive_flutter/hive_flutter.dart';
import 'package:home4u/features/profile/data/models/profile/profile_response_model.dart';

import '../../../../core/utils/app_constants.dart';

abstract class ProfileLocalDataSource {
  Future<ProfileResponseModel?> getProfileData();

  Future<void> cacheProfileData(ProfileResponseModel profileData);
}

class ProfileLocalDataSourceImpl extends ProfileLocalDataSource {
  final Box<ProfileResponseModel> profileBox =
      Hive.box<ProfileResponseModel>(kProfileBox);

  @override
  Future<void> cacheProfileData(ProfileResponseModel profileData) async {
    await profileBox.put(kProfileData, profileData);
  }

  @override
  Future<ProfileResponseModel?> getProfileData() async {
    return profileBox.get(kProfileData);
  }
}
