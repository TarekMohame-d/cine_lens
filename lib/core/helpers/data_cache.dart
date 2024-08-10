late DataCache localCache;

class DataCache {
  final Map<String, dynamic> _cache = {};

  void setData(String key, dynamic value) {
    _cache[key] = value;
  }

  dynamic getData(String key) {
    return _cache[key];
  }

  bool hasData(String key) {
    return _cache.containsKey(key);
  }

  void removeData(String key) {
    _cache.remove(key);
  }

  void clear() {
    _cache.clear();
  }
}

class DataCacheKeys {
  static String nowPlayingMovies = 'nowPlayingMovies';
  static String mostPopularMovies = 'mostPopularMovies';
  static String topRatedMovies = 'topRatedMovies';
  static String upcomingMovies = 'upcomingMovies';
  static String userAccountData = 'userAccountData';
  static String sessionId = 'sessionId';
  static String userId = 'userId';
}
