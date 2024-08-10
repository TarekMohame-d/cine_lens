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
  static const String searchMovies = '/search/movie';
}
