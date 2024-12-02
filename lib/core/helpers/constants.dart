bool isLoggedIn = false;
bool isGuest = false;

class SharedPrefKeys {
  SharedPrefKeys._();
  static const String userId = 'userId';
  static const String sessionId = 'sessionId';
}

class KConstants {
  KConstants._();
  static const String appLogo = 'assets/images/app_logo.png';
  static const String appBranding = 'assets/images/branding.png';
  static const String tmdbLogo = 'assets/svgs/tmdb.svg';
}
