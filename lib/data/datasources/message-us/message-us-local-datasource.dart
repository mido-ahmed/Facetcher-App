import 'package:shared_preferences/shared_preferences.dart';

abstract class MessageUsLocalDataSource {}

class MessageUsLocalDataSourceImpl implements MessageUsLocalDataSource {
  final SharedPreferences sharedPreferences;

  MessageUsLocalDataSourceImpl({required this.sharedPreferences});
}