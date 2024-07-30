import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/themes/app_colors.dart';
import 'package:cine_rank/core/widgets/app_text_button.dart';
import 'package:cine_rank/features/movies/data/models/movie_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/themes/app_text_styles.dart';

class MoviesDetailsStack extends StatelessWidget {
  const MoviesDetailsStack({
    super.key,
    required this.imageUrl,
    required this.screenHeight,
    required this.screenWidth,
    required this.movieDetails,
  });

  final String imageUrl;
  final double screenHeight;
  final double screenWidth;
  final MovieDetailsModel movieDetails;
  String extractYearFromDateString(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return dateTime.year.toString();
  }

  @override
  Widget build(BuildContext context) {
    String releaseDate = extractYearFromDateString(movieDetails.releaseDate!);
    return SizedBox(
      height: (screenHeight * 0.6).h,
      width: double.infinity,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) {
              return Shimmer.fromColors(
                baseColor: AppColors.grey,
                highlightColor: Colors.white,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                  ),
                ),
              );
            },
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                  opacity: 0.3,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 130.h,
              ),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                    baseColor: AppColors.grey,
                    highlightColor: Colors.white,
                    child: Container(
                      height: 280.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                imageBuilder: (context, imageProvider) => Container(
                  height: 280.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 24.0.h),
              child: Row(
                children: [
                  Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.soft,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 8,
                    child: Text(
                      textAlign: TextAlign.center,
                      movieDetails.originalTitle!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.font16WhiteSemiBold,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.soft,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
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
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.0.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppTextButton(
                    onPressed: () {},
                    backgroundColor: AppColors.blueAccent,
                    borderRadius: 32,
                    buttonWidth: 115.w,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.play_arrow_rounded,
                          color: AppColors.white,
                        ),
                        horizontalSpace(8),
                        Text(
                          'Trailer',
                          style: AppTextStyles.font16WhiteMedium,
                        ),
                      ],
                    ),
                  ),
                  horizontalSpace(16),
                  InkWell(
                    onTap: () {
                      debugPrint('Open in browser');
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: 48.0.w,
                      height: 48.0.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.soft,
                      ),
                      child: const Icon(
                        Icons.open_in_new_rounded,
                        color: AppColors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
