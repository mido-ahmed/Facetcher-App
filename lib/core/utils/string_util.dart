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
}