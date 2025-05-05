import 'package:intl/intl.dart';

const String kGovernoratesBox = 'governorates';
const String kCitiesBox = 'cities';

///Need to modify
const String kProfileData = 'kProfileData';
const String kProfileBox = 'kProfileBox';
const String kEngineerProfileBox = 'kEngineerProfileBox';
const String kEngineerProfileData = 'kEngineerProfileData';
const String kTechnicalWorkerProfileBox = 'kTechnicalWorkerBox';
const String kTechnicalWorkerProfileData = 'kTechnicalWorkerProfileData';
const String kEngineeringOfficeProfileBox = 'kEngineeringOfficeBox';
const String kEngineeringOfficeProfileData = 'kEngineeringOfficeProfileData';
const String kProductsBox = 'kProductsBox';
const String kProductsData = 'kProductsData';

///BusinessConfig
const String kBusinessConfigBox = 'kBusinessConfigBox';
const String kBusinessConfigData = 'kBusinessConfigData';

//kProjectsBox
const String kProjectsBox = 'kProjectsBox';
const String kProjectsKey = 'kProjectsKey';

///RenovateYourHouse
const String kRenovateYourHouseLookUpsBox = 'kRenovateYourHouseLookUpsBox';
const String kRenovateYourHouseLookUpsData = 'kRenovateYourHouseLookUpsData';
const String kRenovateYourHouseFixedPackagesBox =
    'kRenovateYourHouseFixedPackagesBox';
const String kRenovateYourHouseFixedPackagesData =
    'kRenovateYourHouseFixedPackagesData';

String? formatDate(DateTime? date) {
  if (date == null) return null;
  final formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(date);
}

bool isLoggedInUser = false;
