import 'package:shared_preferences/shared_preferences.dart';

abstract class UserSubmissionLocalDataSource {}

class UserSubmissionLocalDataSourceImpl implements UserSubmissionLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserSubmissionLocalDataSourceImpl({required this.sharedPreferences});
}
