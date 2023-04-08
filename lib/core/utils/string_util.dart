import 'package:intl/intl.dart';

class StringUtil {
  static String capitalizeFirstLetter(String word) {
    if (word.isEmpty) return word;
    return word.substring(0, 1).toUpperCase() + word.substring(1).toLowerCase();
  }

  static String convertDateTimeToDate(String dateTimeString) {
    final dateTime = DateTime.parse(dateTimeString);
    final formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(dateTime);
  }

  static String formatMobileNumber(String mobileNumber) {
    final cleaned = mobileNumber.replaceAll(RegExp(r'\D'), '');
    final groups = <String>[];
    for (var i = 0; i < cleaned.length; i += 3) {
      final end = i + 3;
      groups.add(cleaned.substring(i, end < cleaned.length ? end : cleaned.length));
    }
    return groups.join('-');
  }
}