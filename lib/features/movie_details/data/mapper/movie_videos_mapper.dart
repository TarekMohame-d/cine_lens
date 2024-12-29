import 'package:cine_rank/features/movie_details/data/models/movie_videos_model.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_videos_entity.dart';

class MovieVideosMapper {
  static MovieVideosEntity toEntity(VideoData videoData) {
    return MovieVideosEntity(
      id: videoData.id ?? '',
      key: videoData.key ?? '',
      name: videoData.name ?? 'N/A',
      site: videoData.site ?? 'N/A',
      size: videoData.size ?? 0,
      type: videoData.type ?? 'N/A',
      official: videoData.official ?? false,
      publishedAt: videoData.publishedAt ?? 'N/A',
    );
  }
}
