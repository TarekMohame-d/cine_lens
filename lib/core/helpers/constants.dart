import 'package:cine_rank/features/movies/data/models/movies_model.dart';

import '../../features/login/data/models/user_account_model.dart';

bool isLoggedInUser = false;

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

  static UserAccountModel? userAccountModel;

  static String? sessionId;
  static int? userId;

  static MoviesModel? nowPlayingMovies;
  static MoviesModel? mostPopularMovies;
  static MoviesModel? topRatedMovies;
  static MoviesModel? upcomingMovies;
}
