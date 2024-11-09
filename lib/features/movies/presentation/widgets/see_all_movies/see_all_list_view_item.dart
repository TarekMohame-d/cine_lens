import 'package:cached_network_image/cached_network_image.dart';
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
import '../../../../../core/themes/text_styles.dart';

class SeeAllListViewItem extends StatelessWidget {
  const SeeAllListViewItem({super.key, required this.movie});
  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    String date = changeDateFormate(movie.releaseDate ?? '');
    String genre = KApiDataHelper.getGenreName(movie.genreIds!);
    String imageUrl = movie.posterPath != null
        ? KApiDataHelper.getImageUrl(path: movie.posterPath!)
        : 'https://static-00.iconduck.com/assets.00/no-image-icon-2048x2048-2t5cx953.png';
    return GestureDetector(
      onTap: () {
        context.pushNamed(KRoutes.movieDetailsScreen, arguments: movie.id);
      },
      child: Container(
        height: 170.0.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: KColors.soft,
        ),
        margin: EdgeInsets.only(bottom: 16.0.h),
        child: Row(
          children: [
            CachedNetworkImage(
              height: 170.h,
              width: 115.w,
              memCacheWidth: 170.w.toInt(),
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
                return const Icon(Icons.error);
              },
            ),
            horizontalSpace(16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.originalTitle!,
                    style: KTextStyles.font16WhiteSemiBold,
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
                        style: KTextStyles.font12GreyMedium,
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
                        '${movie.voteAverage!.toStringAsFixed(1)} / 10',
                        style: KTextStyles.font12GreyMedium,
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
                        style: KTextStyles.font12GreyMedium,
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
    } on Exception {
      return 'N/A';
    }
  }
}
