import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/routing/routes.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/helpers/api_data_helper.dart';
import '../../../../core/themes/colors.dart';

class MoviesListViewItem extends StatelessWidget {
  const MoviesListViewItem({super.key, required this.movie});
  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    String genre = KApiDataHelper.getGenreName(movie.genreIds!);
    String imageUrl = KApiDataHelper.getImageUrl(path: movie.posterPath!);
    return GestureDetector(
      onTap: () {
        context.pushNamed(KRoutes.movieDetailsScreen, arguments: movie.id);
      },
      child: Container(
        margin: EdgeInsets.only(right: 12.0.w),
        width: 160.w,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                memCacheWidth: 160.w.toInt(),
                maxWidthDiskCache: MediaQuery.sizeOf(context).width.toInt(),
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                    baseColor: KColors.grey,
                    highlightColor: KColors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0.r),
                          topRight: Radius.circular(12.0.r),
                        ),
                        color: KColors.white,
                      ),
                    ),
                  );
                },
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0.r),
                      topRight: Radius.circular(12.0.r),
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) {
                  return Center(
                      child: const Icon(Icons.image_not_supported_rounded));
                },
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 8.0.w, top: 8.0.h, bottom: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.r),
                    bottomRight: Radius.circular(12.r),
                  ),
                  color: KColors.soft,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.originalTitle ?? 'N/A',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Spacer(),
                    Text(
                      genre,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: KColors.grey,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
