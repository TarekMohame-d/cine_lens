import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_rank/core/helpers/api_data_helper.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetailsBackgroundImage extends StatelessWidget {
  const MovieDetailsBackgroundImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    String fullImageUrl = KApiDataHelper.getImageUrl(path: imageUrl);
    return CachedNetworkImage(
      imageUrl: fullImageUrl,
      memCacheWidth: MediaQuery.sizeOf(context).width.toInt(),
      maxWidthDiskCache: MediaQuery.sizeOf(context).width.toInt(),
      memCacheHeight: (MediaQuery.sizeOf(context).height * 0.6).toInt(),
      maxHeightDiskCache: (MediaQuery.sizeOf(context).height * 0.6).toInt(),
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: KColors.grey,
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
    );
  }
}
