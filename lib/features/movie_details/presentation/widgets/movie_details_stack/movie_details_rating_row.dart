import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/helpers/font_weight_helper.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailsRatingRow extends StatelessWidget {
  const MovieDetailsRatingRow({super.key, required this.movieDetails});

  final MovieDetailsEntity movieDetails;

  String extractYearFromDateString(String? dateString) {
    if (dateString.isNullOrEmpty()) return 'N/A';
    DateTime dateTime = DateTime.parse(dateString!);
    return dateTime.year.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 90.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                color: KColors.grey,
              ),
              horizontalSpace(2),
              Text(
                extractYearFromDateString(movieDetails.releaseDate),
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: KColors.grey,
                      fontWeight: KFontWeightHelper.semiBold,
                    ),
              ),
            ],
          ),
          horizontalSpace(12),
          Text(
            '|',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: KColors.grey,
                  fontWeight: KFontWeightHelper.semiBold,
                ),
          ),
          horizontalSpace(12),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: KColors.orange,
              ),
              horizontalSpace(2),
              Text(
                movieDetails.voteAverage!.toStringAsFixed(1),
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: KColors.grey,
                      fontWeight: KFontWeightHelper.semiBold,
                    ),
              ),
            ],
          ),
          horizontalSpace(12),
          Text(
            '|',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: KColors.grey,
                  fontWeight: KFontWeightHelper.semiBold,
                ),
          ),
          horizontalSpace(12),
          Row(
            children: [
              const Icon(
                Icons.theaters_rounded,
                color: KColors.grey,
              ),
              horizontalSpace(2),
              Text(
                movieDetails.genres!.first.name!,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: KColors.grey,
                      fontWeight: KFontWeightHelper.semiBold,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
