import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/routing/routes.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/helpers/api_data_helper.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/themes/text_styles.dart';

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
        width: 150.w,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                memCacheWidth: 170.w.toInt(),
                maxWidthDiskCache: MediaQuery.sizeOf(context).width.toInt(),
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                    baseColor: KColors.grey,
                    highlightColor: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  left: 8.0.w,
                  top: 8.0.h,
                  bottom: 8.0.h,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  color: KColors.soft,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.originalTitle!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: KTextStyles.font14WhiteSemiBold,
                    ),
                    Spacer(),
                    Text(
                      genre,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: KTextStyles.font10GreyMedium,
                    ),
                    verticalSpace(8),
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
