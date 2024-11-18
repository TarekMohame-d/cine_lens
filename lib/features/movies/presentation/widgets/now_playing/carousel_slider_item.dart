import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/routing/routes.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/helpers/api_data_helper.dart';
import '../../../../../core/themes/colors.dart';
import '../../../../../core/themes/text_styles.dart';

class CarouselSliderItem extends StatelessWidget {
  const CarouselSliderItem({super.key, required this.movie});
  final MovieEntity movie;

  String changeDateFormate(String date) {
    final DateTime dateTime = DateTime.parse(date);
    final String formattedDate = DateFormat('MMMM d, yyyy').format(dateTime);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    String date = changeDateFormate(movie.releaseDate!);
    String imageUrl = KApiDataHelper.getImageUrl(path: movie.posterPath!);
    return GestureDetector(
      onTap: () {
        context.pushNamed(KRoutes.movieDetailsScreen, arguments: movie.id);
      },
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            memCacheWidth: 220.w.toInt(),
            maxWidthDiskCache: MediaQuery.sizeOf(context).width.toInt(),
            placeholder: (context, url) {
              return Shimmer.fromColors(
                baseColor: KColors.grey,
                highlightColor: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.white,
                  ),
                ),
              );
            },
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50.0.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: KColors.soft.withOpacity(0.7),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 12.0.w,
                  bottom: 6.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.originalTitle!,
                      style: KTextStyles.font16WhiteSemiBold,
                    ),
                    Text(
                      'On $date',
                      style: KTextStyles.font12WhiteGreyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
