class EndPoints {
  // base
  static const String baseStagingUrl = 'http://192.168.1.7:8010/';
  static const String baseProductionUrl = 'http://3.134.84.125:8010/facetcher-service/api';
  // auth
  static const String signin = '$baseProductionUrl/auth/log-in';
  static const String signout = '$baseProductionUrl/auth/log-out';
  static const String currentUser = '$baseProductionUrl/auth/current';
  static const String refreshToken = '$baseProductionUrl/auth/refresh-token';

  // user
  static const String userPassword = '$baseProductionUrl/user/update-password';
  static const String userProfilePicture = '$baseProductionUrl/user/profile-picture';

  // user submission
  static const String userSubmission = '$baseProductionUrl/user-submission';
  static const String currentUserSubmission = '$baseProductionUrl/user-submission/current-user/find-all';

  // user trial
  static const String createUserTrial = '$baseProductionUrl/user-trial/process';
  static const String submitUserTrial = '$baseProductionUrl/user-trial/submit/';
}
