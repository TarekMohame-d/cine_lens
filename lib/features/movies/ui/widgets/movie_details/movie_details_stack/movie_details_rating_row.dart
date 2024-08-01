import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/themes/app_colors.dart';
import 'package:cine_rank/core/themes/app_text_styles.dart';
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
                color: AppColors.grey,
              ),
              horizontalSpace(2),
              Text(
                releaseDate,
                style: AppTextStyles.font14GreySemiBold,
              ),
            ],
          ),
          horizontalSpace(12),
          Text('|', style: AppTextStyles.font14GreySemiBold),
          horizontalSpace(12),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: AppColors.orange,
              ),
              horizontalSpace(2),
              Text(
                movieDetails.voteAverage!.toStringAsFixed(1),
                style: AppTextStyles.font14GreySemiBold,
              ),
            ],
          ),
          horizontalSpace(12),
          Text('|', style: AppTextStyles.font14GreySemiBold),
          horizontalSpace(12),
          Row(
            children: [
              const Icon(
                Icons.theaters_rounded,
                color: AppColors.grey,
              ),
              horizontalSpace(2),
              Text(
                movieDetails.genres!.first.name!,
                style: AppTextStyles.font14GreySemiBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
