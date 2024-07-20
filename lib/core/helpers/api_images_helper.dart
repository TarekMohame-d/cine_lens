class ApiImagesHelper {
  ApiImagesHelper._();

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
}
