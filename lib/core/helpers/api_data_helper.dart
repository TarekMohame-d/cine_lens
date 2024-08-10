class ApiDataHelper {
  ApiDataHelper._();

  static String baseUrl = 'http://image.tmdb.org/t/p/';
  static String secureBaseUrl = 'https://image.tmdb.org/t/p/';

  static Map<int, String> genres = {
    28: "Action",
    12: "Adventure",
    16: "Animation",
    35: "Comedy",
    80: "Crime",
    99: "Documentary",
    18: "Drama",
    10751: "Family",
    14: "Fantasy",
    36: "History",
    27: "Horror",
    10402: "Music",
    9648: "Mystery",
    10749: "Romance",
    878: "Science Fiction",
    10770: "TV Movie",
    53: "Thriller",
    10752: "War",
    37: "Western",
  };

  static Map<String, String> countriesCode = {
    'AE': 'United Arab Emirates',
    'AR': 'Argentina',
    'AT': 'Austria',
    'AU': 'Australia',
    'BO': 'Bolivia',
    'BR': 'Brazil',
    'CA': 'Canada',
    'CH': 'Switzerland',
    'CL': 'Chile',
    'CO': 'Colombia',
    'CR': 'Costa Rica',
    'DE': 'Germany',
    'EC': 'Ecuador',
    'FR': 'France',
    'GB': 'United Kingdom',
    'GT': 'Guatemala',
    'HK': 'Hong Kong',
    'HN': 'Honduras',
    'ID': 'Indonesia',
    'IE': 'Ireland',
    'IN': 'India',
    'KR': 'Korea',
    'MX': 'Mexico',
    'MY': 'Malaysia',
    'NZ': 'New Zealand',
    'PE': 'Peru',
    'PH': 'Philippines',
    'PL': 'Poland',
    'PY': 'Paraguay',
    'TH': 'Thailand',
    'TW': 'Taiwan',
    'US': 'United States',
    'VE': 'Venezuela',
  };

  /// images size = [w92, w154, w185, w300, w342, w500, w780, original]
  static String getImageUrl({required String path, String size = 'original'}) {
    return '$secureBaseUrl$size$path';
  }

  /// return movie genre name
  static String getGenreName(int id) {
    return genres[id] ?? 'Unknown';
  }

  /// return movie country name
  static String getCountryName(String code) {
    return countriesCode[code] ?? 'Unknown';
  }
}
