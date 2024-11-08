class KApiConstants {
  static const String apiBaseUrl = 'https://api.themoviedb.org/3';

  // Endpoints
  static const String requestTokenEndpoint = '/authentication/token/new';
  static const String createSessionEndpoint = '/authentication/session/new';
  static const String accountEndpoint = '/account';
  static const String nowPlayingMoviesEndpoint = '/movie/now_playing';
  static const String mostPopularMoviesEndpoint = '/movie/popular';
  static const String topRatedMoviesEndpoint = '/movie/top_rated';
  static const String upcomingMoviesEndpoint = '/movie/upcoming';
  static const String searchMoviesEndpoint = '/search/movie';
}
