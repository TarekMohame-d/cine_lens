import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_rank/core/helpers/api_data_helper.dart';
import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/helpers/font_weight_helper.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/core/widgets/conditional_builder.dart';
import 'package:cine_rank/features/movie_details/data/models/movie_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MovieProductionCompanies extends StatelessWidget {
  const MovieProductionCompanies(
      {super.key, required this.productionCompanies});

  final List<ProductionCompanies> productionCompanies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Production Companies',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: KFontWeightHelper.semiBold,
                ),
          ),
          SizedBox(
            height: 80.0.h,
            child: ConditionalBuilder(
              fallback: Center(
                child: Text(
                  'No production companies available',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              widget: ListView.builder(
                itemCount: productionCompanies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  String imageUrl = KApiDataHelper.getImageUrl(
                      path: productionCompanies[index].logoPath);

                  return Padding(
                    padding: EdgeInsets.only(right: 12.0.w),
                    child: Row(
                      children: [
                        ConditionalBuilder(
                          fallback: Container(
                            width: 52.0.w,
                            height: 52.0.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: KColors.grey.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.image_not_supported_rounded,
                              ),
                            ),
                          ),
                          widget: CachedNetworkImage(
                            imageUrl: imageUrl,
                            width: 52.0.w,
                            height: 52.0.w,
                            memCacheWidth: 52.0.w.toInt(),
                            maxWidthDiskCache:
                                MediaQuery.sizeOf(context).width.toInt(),
                            placeholder: (context, url) {
                              return Shimmer.fromColors(
                                baseColor: KColors.grey,
                                highlightColor: Colors.white,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                              );
                            },
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: KColors.whiteGrey,
                                borderRadius: BorderRadius.circular(12.r),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              width: 52.0.w,
                              height: 52.0.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: KColors.grey.withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.image_not_supported_rounded,
                                ),
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
                              productionCompanies[index].name ?? 'N/A',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              productionCompanies[index].originCountry ?? 'N/A',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    color: KColors.grey,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              condition: productionCompanies.isNotEmpty,
            ),
          ),
        ],
      ),
    );
  }
}
