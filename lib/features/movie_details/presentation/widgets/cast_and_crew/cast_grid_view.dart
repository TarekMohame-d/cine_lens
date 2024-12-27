import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_rank/core/helpers/api_data_helper.dart';
import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/core/widgets/conditional_builder.dart';
import 'package:cine_rank/features/movie_details/data/models/movie_cast_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CastGridView extends StatelessWidget {
  const CastGridView({super.key, required this.cast});

  final List<Cast> cast;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 3 / 5,
      ),
      itemCount: cast.length,
      itemBuilder: (context, index) {
        String? imageUrl =
            KApiDataHelper.getImageUrl(path: cast[index].profilePath);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: ConditionalBuilder(
                fallback: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: KColors.grey.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0.r),
                      topRight: Radius.circular(12.0.r),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.image_not_supported_rounded,
                      size: 54.r,
                    ),
                  ),
                ),
                widget: CachedNetworkImage(
                  imageUrl: imageUrl,
                  memCacheWidth: 200.0.w.toInt(),
                  maxWidthDiskCache:
                      (MediaQuery.sizeOf(context).width / 2).toInt(),
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
                  errorWidget: (context, url, error) =>
                      Icon(Icons.image_not_supported_rounded),
                ),
                condition: !imageUrl.isNullOrEmpty(),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 8.0.w),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cast[index].name ?? 'N/A',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      cast[index].character ?? 'N/A',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: KColors.grey,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
