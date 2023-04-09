class EndPoints {
  // base
  static const String baseStagingUrl = 'http://192.168.1.7:8010/';
  static const String baseProductionUrl = 'http://18.189.192.65:8010/facetcher-service/api';

  // auth
  static const String signin = '$baseProductionUrl/auth/log-in';
  static const String signout = '$baseProductionUrl/auth/log-out';
  static const String currentUser = '$baseProductionUrl/auth/current';
  static const String refreshToken = '$baseProductionUrl/auth/refresh-token';

  // user
  static const String userProfilePicture = '$baseProductionUrl/user/profile-picture';

  // user submission
  static const String userSubmission = '$baseProductionUrl/user-submission';

  // user trial
  static const String createUserTrial = '$baseProductionUrl/user-trial/process';
  static const String submitUserTrial = '$baseProductionUrl/user-trial/submit/';
}
