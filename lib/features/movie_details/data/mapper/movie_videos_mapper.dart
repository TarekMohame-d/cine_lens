import 'package:cine_rank/features/movie_details/data/models/movie_videos_model.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_videos_entity.dart';

class MovieVideosMapper {
  static MovieVideosEntity toEntity(VideoData videoData) {
    return MovieVideosEntity(
      id: videoData.id,
      key: videoData.key,
      name: videoData.name,
      site: videoData.site,
      size: videoData.size,
      type: videoData.type,
      official: videoData.official,
      publishedAt: videoData.publishedAt,
    );
  }
}
