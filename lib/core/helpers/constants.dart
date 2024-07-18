import '../../features/login/data/models/user_account_model.dart';

bool isLoggedInUser = false;

class SharedPrefKeys {
  static const String isLoggedInUser = 'isLoggedInUser';
  static const String requestToken = 'requestToken';
  static const String sessionId = 'sessionId';
  static const String userId = 'userId';
}

class AppConstants {
  static const String appLogo = 'assets/images/app_logo.png';
  static const String appBranding = 'assets/images/branding.png';
  static const String tmdb = 'assets/svgs/tmdb.svg';

  static UserAccountModel? userAccountModel;

  static String? sessionId;
  static int? userId;
}
