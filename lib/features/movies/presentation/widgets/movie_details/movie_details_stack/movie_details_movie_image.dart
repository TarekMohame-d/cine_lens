import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_rank/core/helpers/api_data_helper.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetailsMovieImage extends StatelessWidget {
  const MovieDetailsMovieImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    String fullImageUrl = KApiDataHelper.getImageUrl(path: imageUrl);
    return Padding(
      padding: EdgeInsets.only(
        bottom: 130.h,
      ),
      child: CachedNetworkImage(
        imageUrl: fullImageUrl,
        placeholder: (context, url) {
          return Shimmer.fromColors(
            baseColor: KColors.grey,
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
    );
  }
}
