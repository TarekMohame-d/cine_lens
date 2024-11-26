import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_rank/core/helpers/api_data_helper.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/core/themes/text_styles.dart';
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
            style: KTextStyles.font16WhiteSemiBold,
          ),
          SizedBox(
            height: 80.0.h,
            child: ListView.builder(
              itemCount: productionCompanies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                String imageUrl = KApiDataHelper.getImageUrl(
                    path: productionCompanies[index].logoPath);
                return Padding(
                  padding: EdgeInsets.only(right: 12.0.w),
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: imageUrl,
                        width: 52.0.w,
                        height: 52.0.w,
                        memCacheWidth:
                            imageUrl.isNotEmpty ? 72.0.w.toInt() : null,
                        maxWidthDiskCache: imageUrl.isNotEmpty
                            ? MediaQuery.sizeOf(context).width.toInt()
                            : null,
                        placeholder: (context, url) {
                          return Shimmer.fromColors(
                            baseColor: KColors.grey,
                            highlightColor: Colors.white,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          );
                        },
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: KColors.white,
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.image_not_supported_rounded,
                            color: KColors.black,
                          ),
                        ),
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
                            style: KTextStyles.font14WhiteSemiBold,
                          ),
                          Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            productionCompanies[index].originCountry ?? 'N/A',
                            style: KTextStyles.font10GreyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
