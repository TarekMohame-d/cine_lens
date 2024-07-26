class ApiDataHelper {
  ApiDataHelper._();

  static String baseUrl = 'http://image.tmdb.org/t/p/';
  static String secureBaseUrl = 'https://image.tmdb.org/t/p/';
  static List<String> backdropSizes = [
    'w300',
    'w780',
    'w1280',
    'original',
  ];

  static List<String> logoSizes = [
    'w45',
    'w92',
    'w154',
    'w185',
    'w300',
    'w500',
    'original',
  ];

  static List<String> posterSizes = [
    'w92',
    'w154',
    'w185',
    'w342',
    'w500',
    'w780',
    'original',
  ];

  static List<String> profileSizes = [
    'w45',
    'w185',
    'h632',
    'original',
  ];

  static List<String> stillSizes = [
    'w92',
    'w185',
    'w300',
    'original',
  ];

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

  static String getImageUrl(String path) {
    return '$secureBaseUrl${posterSizes.last}$path';
  }
}
