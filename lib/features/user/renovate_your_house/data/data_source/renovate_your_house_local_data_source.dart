import 'package:hive/hive.dart';
import 'package:home4u/core/utils/app_constants.dart';

import '../models/renovate_your_house_fixed_packages_model.dart';
import '../models/renovate_your_house_look_ups_model.dart';

abstract class RenovateYourHouseLocalDataSource {
  Future<void> saveRenovateYourHouseLookUps(
    RenovateYourHouseLookUpsModel renovateYourHouseLookUpsModel,
  );

  Future<RenovateYourHouseLookUpsModel?> getRenovateYourHouseLookUps();

  Future<void> saveRenovateYourHouseFixedPackages(
    RenovateYourHouseFixedPackagesModel renovateYourHouseFixedPackagesModel,
  );

  Future<RenovateYourHouseFixedPackagesModel?>
      getRenovateYourHouseFixedPackages();
}

class RenovateYourHouseLocalDataSourceImpl
    extends RenovateYourHouseLocalDataSource {
  final Box<RenovateYourHouseLookUpsModel> renovateYourHouseLookUpsBox =
      Hive.box<RenovateYourHouseLookUpsModel>(kRenovateYourHouseLookUpsBox);

  final Box<RenovateYourHouseFixedPackagesModel>
      renovateYourHouseFixedPackagesBox =
      Hive.box<RenovateYourHouseFixedPackagesModel>(
          kRenovateYourHouseFixedPackagesBox);

  @override
  Future<RenovateYourHouseFixedPackagesModel?>
      getRenovateYourHouseFixedPackages() async {
    return renovateYourHouseFixedPackagesBox
        .get(kRenovateYourHouseFixedPackagesData);
  }

  @override
  Future<RenovateYourHouseLookUpsModel?> getRenovateYourHouseLookUps() async {
    return renovateYourHouseLookUpsBox.get(kRenovateYourHouseLookUpsData);
  }

  @override
  Future<void> saveRenovateYourHouseFixedPackages(
    RenovateYourHouseFixedPackagesModel renovateYourHouseFixedPackagesModel,
  ) async {
    await renovateYourHouseFixedPackagesBox.put(
      kRenovateYourHouseFixedPackagesData,
      renovateYourHouseFixedPackagesModel,
    );
  }

  @override
  Future<void> saveRenovateYourHouseLookUps(
    RenovateYourHouseLookUpsModel renovateYourHouseLookUpsModel,
  ) async {
    await renovateYourHouseLookUpsBox.put(
      kRenovateYourHouseLookUpsData,
      renovateYourHouseLookUpsModel,
    );
  }
}
