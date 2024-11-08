import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/core/themes/text_styles.dart';
import 'package:cine_rank/features/movies/data/models/movie_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailsRatingRow extends StatelessWidget {
  const MovieDetailsRatingRow({super.key, required this.movieDetails});

  final MovieDetailsModel movieDetails;

  String extractYearFromDateString(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return dateTime.year.toString();
  }

  @override
  Widget build(BuildContext context) {
    String releaseDate = extractYearFromDateString(movieDetails.releaseDate!);
    return Padding(
      padding: EdgeInsets.only(bottom: 90.0.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                color: KColors.grey,
              ),
              horizontalSpace(2),
              Text(
                releaseDate,
                style: KTextStyles.font14GreySemiBold,
              ),
            ],
          ),
          horizontalSpace(12),
          Text('|', style: KTextStyles.font14GreySemiBold),
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
                style: KTextStyles.font14GreySemiBold,
              ),
            ],
          ),
          horizontalSpace(12),
          Text('|', style: KTextStyles.font14GreySemiBold),
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
                style: KTextStyles.font14GreySemiBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
