import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/helpers/api_data_helper.dart';
import '../../../../../../core/helpers/extensions.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/themes/app_colors.dart';
import '../../../../../../core/themes/app_text_styles.dart';
import '../../../../data/models/movie_cast_model.dart';

class CastAndCrew extends StatelessWidget {
  const CastAndCrew({super.key, required this.castModel});
  final CastModel? castModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Cast And Crew',
                style: AppTextStyles.font16WhiteSemiBold,
              ),
              const Spacer(),
              InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  context.pushNamed(Routes.movieDetailsCastAndCrewSeeAll,
                      arguments: castModel);
                },
                child: Text(
                  'See all',
                  style: AppTextStyles.font14BlueAccentMedium,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80.0.h,
            child: ListView.builder(
              itemCount:
                  castModel!.cast!.length > 5 ? 5 : castModel!.cast!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                String imageUrl = castModel!.cast![index].profilePath != null
                    ? ApiDataHelper.getImageUrl(
                        path: castModel!.cast![index].profilePath!)
                    : 'https://static-00.iconduck.com/assets.00/no-image-icon-2048x2048-2t5cx953.png';
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
                          width: 48.0.w,
                          height: 48.0.h,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
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
                            castModel!.cast![index].name!,
                            style: AppTextStyles.font14WhiteSemiBold,
                          ),
                          Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            castModel!.cast![index].knownForDepartment!,
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
