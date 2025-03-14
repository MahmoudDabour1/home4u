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
const String kProductsBox = 'kProductsBox';
const String kProductsData = 'kProductsData';

//kProjectsBox
const String kProjectsBox = 'kProjectsBox';
const String kProjectsKey = 'kProjectsKey';

String? formatDate(DateTime? date) {
  if (date == null) return null;
  final formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(date);
}
bool isLoggedInUser = false;
