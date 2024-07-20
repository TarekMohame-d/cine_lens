import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_rank/core/helpers/api_images_helper.dart';
import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/routing/routes.dart';
import 'package:cine_rank/core/themes/app_colors.dart';
import 'package:cine_rank/core/themes/app_text_styles.dart';
import 'package:cine_rank/features/movies/data/models/movies_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class CarouselSliderItem extends StatelessWidget {
  const CarouselSliderItem({super.key, required this.moviesModel});
  final Results? moviesModel;

  String changeDateFormate(String date) {
    final DateTime dateTime = DateTime.parse(date);
    final String formattedDate = DateFormat('MMMM d, yyyy').format(dateTime);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    String date = changeDateFormate(moviesModel!.releaseDate!);
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        context.pushNamed(Routes.seeAllMoviesScreen, arguments: moviesModel);
      },
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                '${ApiImagesHelper.secureBaseUrl + ApiImagesHelper.posterSizes.last}${moviesModel!.posterPath}',
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return Shimmer.fromColors(
                baseColor: AppColors.lineDark,
                highlightColor: Colors.white,
                child: Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.white,
                  ),
                ),
              );
            },
            imageBuilder: (context, imageProvider) => Container(
              height: 200.h,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50.0.h,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: Colors.grey.withOpacity(0.7),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 12.0.w,
                bottom: 6.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    moviesModel!.originalTitle!,
                    style: AppTextStyles.font16WhiteSemiBold,
                  ),
                  Text(
                    'On $date',
                    style: AppTextStyles.font12WhiteGreyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
