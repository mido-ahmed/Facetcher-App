import 'package:shared_preferences/shared_preferences.dart';

abstract class UserTrialLocalDataSource {}

class UserTrialLocalDataSourceImpl implements UserTrialLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserTrialLocalDataSourceImpl({required this.sharedPreferences});
}
