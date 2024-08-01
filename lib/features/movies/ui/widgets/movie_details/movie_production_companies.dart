import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_rank/core/helpers/api_data_helper.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/themes/app_colors.dart';
import 'package:cine_rank/core/themes/app_text_styles.dart';
import 'package:cine_rank/features/movies/data/models/movie_details_model.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Production Companies',
            style: AppTextStyles.font16WhiteSemiBold,
          ),
          SizedBox(
            height: 80.0.h,
            child: ListView.builder(
              itemCount: productionCompanies.length > 5
                  ? 5
                  : productionCompanies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                String imageUrl = ApiDataHelper.getImageUrl(
                    path: productionCompanies[index].logoPath!);
                return Padding(
                  padding: EdgeInsets.only(right: 12.0.w),
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: imageUrl,
                        placeholder: (context, url) {
                          return Shimmer.fromColors(
                            baseColor: AppColors.grey,
                            highlightColor: Colors.white,
                            child: Container(
                              width: 48.0.w,
                              height: 48.0.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                        imageBuilder: (context, imageProvider) => Container(
                          width: 60.0.w,
                          height: 60.0.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.contain,
                            ),
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
                            productionCompanies[index].name!,
                            style: AppTextStyles.font14WhiteSemiBold,
                          ),
                          Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            productionCompanies[index].originCountry!,
                            style: AppTextStyles.font10GreyMedium,
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
