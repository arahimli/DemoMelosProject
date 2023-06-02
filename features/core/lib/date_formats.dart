import 'package:intl/intl.dart';

final dashedDateFormat = DateFormat('y-MM-dd');
final dottedDateFormat = DateFormat('dd.MM.y');

DateFormat getDateFormat(String locale) {
  return DateFormat('d MMMM, HH:mm', locale);
}

DateFormat getMonthDayFormat(String locale) {
  return DateFormat('d MMMM', locale);
}

DateFormat getMonthFormat(String locale) {
  return DateFormat('d MMM y', locale);
}
