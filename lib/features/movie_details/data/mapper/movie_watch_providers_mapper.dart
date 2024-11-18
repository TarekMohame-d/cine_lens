import 'package:cine_rank/features/movie_details/data/models/movie_watch_providers_model.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_watch_providers_entity.dart';

class MovieWatchProvidersMapper {
  static MovieWatchProvidersEntity toEntity(MovieWatchProvidersModel model) {
    return MovieWatchProvidersEntity(
      results: model.results,
    );
  }
}
