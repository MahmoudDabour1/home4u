import 'package:hive/hive.dart';
import 'package:home4u/core/utils/app_constants.dart';
import 'package:home4u/features/auth/sign_up/data/models/governorate_model.dart';

abstract class CommonLocalDataSource {
  List<GovernorateDataModel> getLocalGovernorates();
}

class CommonLocalDataSourceImpl implements CommonLocalDataSource {
  @override
  List<GovernorateDataModel> getLocalGovernorates() {
    Box<GovernorateDataModel> governoratesBox =
        Hive.box<GovernorateDataModel>(kGovernoratesBox);
    List<GovernorateDataModel> governorates = governoratesBox.values.toList();
    return governorates;
  }
}
