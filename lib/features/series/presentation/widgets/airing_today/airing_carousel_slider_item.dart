import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_lens/core/helpers/api_data_helper.dart';
import 'package:cine_lens/core/helpers/extensions.dart';
import 'package:cine_lens/core/themes/colors.dart';
import 'package:cine_lens/core/widgets/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AiringCarouselSliderItem extends StatelessWidget {
  const AiringCarouselSliderItem({super.key, required this.posterPath});

  final String posterPath;

  @override
  Widget build(BuildContext context) {
    String imageUrl = KApiDataHelper.getImageUrl(path: posterPath);
    return ConditionalBuilder(
      fallback: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: KColors.soft,
        ),
        child: Center(
          child: Icon(
            Icons.image_not_supported_rounded,
            size: 56.r,
          ),
        ),
      ),
      widget: CachedNetworkImage(
        imageUrl: imageUrl,
        memCacheHeight: (MediaQuery.sizeOf(context).height * 0.6).toInt(),
        maxHeightDiskCache: (MediaQuery.sizeOf(context).height * 0.6).toInt(),
        placeholder: (context, url) {
          return Shimmer.fromColors(
            baseColor: KColors.grey,
            highlightColor: KColors.white,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: KColors.white,
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
            ),
          ),
        ),
        errorWidget: (context, url, error) {
          return Center(child: const Icon(Icons.image_not_supported_rounded));
        },
      ),
      condition: !imageUrl.isNullOrEmpty(),
    );
  }
}
