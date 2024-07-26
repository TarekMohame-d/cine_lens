class ApiConstants {
  static const String apiBaseUrl = 'https://api.themoviedb.org/3';
}

class ApiEndPoints {
  static const String requestToken = '/authentication/token/new';
  static const String createSession = '/authentication/session/new';
  static const String account = '/account';
  static const String moviesNowPlaying = '/movie/now_playing';
  static const String moviesMostPopular = '/movie/popular';
  static const String moviesTopRated = '/movie/top_rated';
  static const String moviesUpcoming = '/movie/upcoming';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
