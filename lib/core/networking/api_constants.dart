class KApiConstants {
  static const String apiBaseUrl = 'https://api.themoviedb.org/3';

  // Endpoints
  static const String requestTokenEndpoint = '/authentication/token/new';
  static const String createSessionEndpoint = '/authentication/session/new';
  static const String accountEndpoint = '/account';

  static const String discoverMoviesEndpoint = '/discover/movie';

  static const String searchMoviesEndpoint = '/search/movie';
  static const String movieDetailsEndpoint = '/movie/';
  static const String movieVideosEndpoint = '/movie/';
  static const String movieWatchProvidersEndpoint = '/movie/';
  static const String movieCastAndCrewEndpoint = '/movie/';
}
