bool isLoggedIn = false;
bool? isGuest;

class SharedPrefKeys {
  SharedPrefKeys._();
  static const String isGuest = 'isGuest';
}

class SecureStorageKeys {
  SecureStorageKeys._();
  static const String userId = 'userId';
  static const String sessionId = 'sessionId';
}

class KConstants {
  KConstants._();
  static const String appLogo = 'assets/images/logo.png';
  static const String tmdbLogo = 'assets/svgs/tmdb.svg';
}
