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
        width: 200.w,
        height: 280.h,
        memCacheWidth: (200.w * MediaQuery.devicePixelRatioOf(context)).toInt(),
        maxWidthDiskCache: MediaQuery.sizeOf(context).width.toInt(),
        memCacheHeight:
            (280.h * MediaQuery.devicePixelRatioOf(context)).toInt(),
        maxHeightDiskCache: (MediaQuery.sizeOf(context).height * 0.6).toInt(),
        placeholder: (context, url) {
          return Shimmer.fromColors(
            baseColor: KColors.grey,
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
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
            ),
          ),
        ),
        errorWidget: (context, url, error) {
          return Center(child: const Icon(Icons.image_not_supported_rounded));
        },
      ),
    );
  }
}
