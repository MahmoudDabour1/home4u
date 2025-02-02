import 'package:intl/intl.dart';

const String kGovernoratesBox = 'governorates';
const String kCitiesBox = 'cities';


String? formatDate(DateTime? date) {
  if (date == null) return null;
  final formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(date);
}