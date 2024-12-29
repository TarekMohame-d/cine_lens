import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_rank/core/helpers/api_data_helper.dart';
import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/core/widgets/conditional_builder.dart';
import 'package:cine_rank/features/movie_details/data/models/movie_cast_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CastListViewItem extends StatelessWidget {
  const CastListViewItem({super.key, required this.cast});

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    String imageUrl = KApiDataHelper.getImageUrl(path: cast.profilePath);

    return Padding(
      padding: EdgeInsets.only(right: 12.0.w),
      child: Row(
        children: [
          ConditionalBuilder(
            fallback: Container(
              width: 72.0.w,
              height: 72.0.w,
              decoration: BoxDecoration(
                color: KColors.grey.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.image_not_supported_rounded,
                ),
              ),
            ),
            widget: CachedNetworkImage(
              width: 72.0.w,
              height: 72.0.w,
              imageUrl: imageUrl,
              memCacheWidth: 72.0.w.toInt(),
              maxWidthDiskCache: 200.0.w.toInt(),
              placeholder: (context, url) {
                return Shimmer.fromColors(
                  baseColor: KColors.grey,
                  highlightColor: Colors.white,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                );
              },
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  color: KColors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.image_not_supported_rounded,
                  color: KColors.black,
                  size: 38.r,
                ),
              ),
            ),
            condition: !imageUrl.isNullOrEmpty(),
          ),
          horizontalSpace(4),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                cast.name ?? 'N/A',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                cast.knownForDepartment ?? 'N/A',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: KColors.grey,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
