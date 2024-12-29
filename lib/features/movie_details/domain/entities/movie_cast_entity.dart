import 'package:cine_rank/features/movie_details/data/models/movie_cast_model.dart';

class MovieCastAndCrewEntity {
  final List<Cast> cast;
  final List<Crew> crew;

  MovieCastAndCrewEntity({required this.cast, required this.crew});
}
