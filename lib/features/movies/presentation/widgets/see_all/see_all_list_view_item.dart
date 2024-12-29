import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_rank/core/widgets/conditional_builder.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/helpers/api_data_helper.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/themes/colors.dart';

class SeeAllListViewItem extends StatelessWidget {
  const SeeAllListViewItem({super.key, required this.movie});
  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    String date = changeDateFormate(movie.releaseDate);
    String genre = KApiDataHelper.getGenreName(movie.genreIds);
    String imageUrl = KApiDataHelper.getImageUrl(path: movie.posterPath);
    return GestureDetector(
      onTap: () {
        context.pushNamed(KRoutes.movieDetailsScreen, arguments: movie.id);
      },
      child: Container(
        height: 170.0.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: KColors.soft,
        ),
        margin: EdgeInsets.only(bottom: 16.0.h),
        child: Row(
          children: [
            ConditionalBuilder(
              fallback: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.transparent,
                ),
                width: 120.w,
                height: 170.0.h,
                child: Center(
                  child: Icon(
                    Icons.image_not_supported_rounded,
                    size: 56.r,
                  ),
                ),
              ),
              widget: CachedNetworkImage(
                width: 120.w,
                memCacheWidth: 120.w.toInt(),
                maxWidthDiskCache: MediaQuery.sizeOf(context).width.toInt(),
                imageUrl: imageUrl,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: KColors.grey,
                  highlightColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                  ),
                ),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
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
              condition: !imageUrl.isNullOrEmpty(),
            ),
            horizontalSpace(16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.originalTitle,
                    style: Theme.of(context).textTheme.labelLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(12),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        color: KColors.grey,
                      ),
                      horizontalSpace(4),
                      Text(
                        date,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  verticalSpace(12),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: KColors.orange,
                      ),
                      horizontalSpace(4),
                      Text(
                        '${movie.voteAverage.toStringAsFixed(1)} / 10',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  verticalSpace(12),
                  Row(
                    children: [
                      const Icon(
                        Icons.theaters,
                        color: KColors.grey,
                      ),
                      horizontalSpace(4),
                      Text(
                        genre,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String changeDateFormate(String date) {
    try {
      final DateTime dateTime = DateTime.parse(date);
      final String formattedDate = DateFormat('MMMM d, yyyy').format(dateTime);
      return formattedDate;
    } catch (e) {
      return 'N/A';
    }
  }
}
