import 'package:cine_rank/features/movie_details/data/models/movie_cast_model.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_cast_entity.dart';

class MovieCastMapper {
  static MovieCastAndCrewEntity toEntity(CastAndCrewModel model) {
    return MovieCastAndCrewEntity(
      cast: model.cast,
      crew: model.crew,
    );
  }
}
