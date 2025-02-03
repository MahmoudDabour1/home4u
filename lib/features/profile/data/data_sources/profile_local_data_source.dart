import 'package:hive_flutter/hive_flutter.dart';
import 'package:home4u/features/profile/data/models/profile/profile_response_model.dart';

import '../../../../core/utils/app_constants.dart';

Future<void> initHive() async {
  await Hive.initFlutter();

  // try {
  //   await Hive.deleteBoxFromDisk(kProfileBox);
  // } catch (e) {
  //   print('No existing box to delete');
  // }

  _registerHiveAdapters();
  await Hive.openBox<ProfileResponseModel>(kProfileBox);

}

void _registerHiveAdapters() {
  // Register Hive Adapters
  if (!Hive.isAdapterRegistered(70)) {
    Hive.registerAdapter(ProfileResponseModelAdapter());
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
}
abstract class ProfileLocalDataSource {
  Future<ProfileResponseModel?> getProfileData();
  Future<void> cacheProfileData(ProfileResponseModel profileData);
}

class ProfileLocalDataSourceImpl extends ProfileLocalDataSource {

  final Box<ProfileResponseModel> profileBox = Hive.box<ProfileResponseModel>(kProfileBox);

  @override
  Future<void> cacheProfileData(ProfileResponseModel profileData) async {
    await profileBox.put(kProfileData, profileData);
  }

  @override
  Future<ProfileResponseModel?> getProfileData() async {
    return profileBox.get(kProfileData);
  }
}