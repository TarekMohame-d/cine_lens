class DataCache {
  static final DataCache _instance = DataCache._internal();

  factory DataCache() {
    return _instance;
  }

  DataCache._internal();

  final Map<String, dynamic> _cache = {};

  void setData(String key, dynamic value) {
    _cache[key] = value;
  }

  dynamic getData(String key) {
    return _cache[key];
  }
}

late DataCache cache;

class DataCacheKeys {
  static String nowPlayingMovies = 'nowPlayingMovies';
  static String mostPopularMovies = 'mostPopularMovies';
  static String topRatedMovies = 'topRatedMovies';
  static String upcomingMovies = 'upcomingMovies';
  static String userAccount = 'userAccount';
  static String sessionId = 'sessionId';
  static String userId = 'userId';
}
