bool isLoggedInUser = false;
bool isGuestUser = false;

class SharedPrefKeys {
  SharedPrefKeys._();
  static const String isLoggedInUser = 'isLoggedInUser';
  static const String requestToken = 'requestToken';
  static const String sessionId = 'sessionId';
  static const String userId = 'userId';
}

class AppConstants {
  AppConstants._();
  static const String appLogo = 'assets/images/app_logo.png';
  static const String appBranding = 'assets/images/branding.png';
  static const String tmdb = 'assets/svgs/tmdb.svg';
}
