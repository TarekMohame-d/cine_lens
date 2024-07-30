import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/helpers/api_data_helper.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/app_text_styles.dart';
import '../../../data/models/movies_model.dart';

class GeneralMoviesListViewItem extends StatelessWidget {
  const GeneralMoviesListViewItem({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    String genre = ApiDataHelper.genres[movie.genreIds!.first]!;
    String imageUrl = ApiDataHelper.getImageUrl(movie.posterPath!);
    return Container(
      margin: EdgeInsets.only(right: 12.0.w),
      width: 150.w,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, url) {
                    return Shimmer.fromColors(
                      baseColor: AppColors.grey,
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
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(
                left: 8.0.w,
                right: 8.0.w,
                top: 12.0.h,
                bottom: 8.0.h,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                color: AppColors.soft,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.font14WhiteSemiBold,
                  ),
                  const Spacer(),
                  Text(
                    genre,
                    style: AppTextStyles.font10GreyMedium,
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
