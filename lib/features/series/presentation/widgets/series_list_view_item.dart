import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_lens/core/helpers/api_data_helper.dart';
import 'package:cine_lens/core/helpers/extensions.dart';
import 'package:cine_lens/core/routing/routes.dart';
import 'package:cine_lens/core/themes/colors.dart';
import 'package:cine_lens/core/widgets/conditional_builder.dart';
import 'package:cine_lens/features/series/domain/entities/series_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class SeriesListViewItem extends StatelessWidget {
  const SeriesListViewItem({super.key, required this.series});

  final SeriesEntity series;

  @override
  Widget build(BuildContext context) {
    String genre = KApiDataHelper.getGenreName(series.genreId);
    String imageUrl = KApiDataHelper.getImageUrl(path: series.posterPath);
    return GestureDetector(
      onTap: () {
        // context.pushNamed(KRoutes.movieDetailsScreen, arguments: series.id);
      },
      child: Container(
        margin: EdgeInsets.only(right: 12.0.w),
        width: 300.w,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ConditionalBuilder(
                fallback: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.r),
                    color: KColors.soft,
                  ),
                  width: 300.w,
                  child: Center(
                    child: Icon(
                      Icons.image_not_supported_rounded,
                      size: 56.r,
                    ),
                  ),
                ),
                widget: CachedNetworkImage(
                  imageUrl: imageUrl,
                  memCacheWidth: 300.w.toInt(),
                  maxWidthDiskCache: MediaQuery.sizeOf(context).width.toInt(),
                  placeholder: (context, url) {
                    return Shimmer.fromColors(
                      baseColor: KColors.grey,
                      highlightColor: KColors.white,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0.r),
                            topRight: Radius.circular(12.0.r),
                          ),
                          color: KColors.white,
                        ),
                      ),
                    );
                  },
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0.r),
                        topRight: Radius.circular(12.0.r),
                      ),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) {
                    return Center(
                        child: const Icon(Icons.image_not_supported_rounded));
                  },
                ),
                condition: !imageUrl.isNullOrEmpty(),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 8.0.w, top: 8.0.h, bottom: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.r),
                    bottomRight: Radius.circular(12.r),
                  ),
                  color: KColors.soft,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      series.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Spacer(),
                    Text(
                      genre,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: KColors.grey,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
