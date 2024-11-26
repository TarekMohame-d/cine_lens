import 'package:cine_rank/features/movie_details/data/models/movie_cast_model.dart';

class MovieCastEntity {
  final List<Cast>? cast;
  final List<Crew>? crew;

  MovieCastEntity({required this.cast, required this.crew});
}
