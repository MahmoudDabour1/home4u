import 'package:intl/intl.dart';

const String kGovernoratesBox = 'governorates';
const String kCitiesBox = 'cities';
const String kProfileData = 'kProfileData';
const String kProfileBox = 'kProfileBox';
//kProjectsBox
const String kProjectsBox = 'kProjectsBox';
const String kProjectsKey = 'kProjectsKey';

String? formatDate(DateTime? date) {
  if (date == null) return null;
  final formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(date);
}