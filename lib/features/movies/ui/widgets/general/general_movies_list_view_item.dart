import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_rank/core/helpers/api_images_helper.dart';
import 'package:cine_rank/core/themes/app_text_styles.dart';
import 'package:cine_rank/features/movies/data/models/movies_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/themes/app_colors.dart';

class GeneralMoviesListViewItem extends StatelessWidget {
  const GeneralMoviesListViewItem({super.key, required this.movie});
  final Results movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12.0.w),
      height: 230.h,
      width: 135.w,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      '${ApiImagesHelper.secureBaseUrl + ApiImagesHelper.posterSizes.last}${movie.posterPath}',
                  placeholder: (context, url) {
                    return Shimmer.fromColors(
                      baseColor: AppColors.lineDark,
                      highlightColor: Colors.white,
                      child: Container(
                        height: 230.h,
                        width: 135.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
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
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(
                left: 8.0.w,
                right: 8.0.w,
                top: 12.0.h,
                bottom: 8.0.h,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.font14WhiteSemiBold,
                  ),
                  Text(
                    'Action',
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
