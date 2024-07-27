import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../core/helpers/api_data_helper.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/app_text_styles.dart';
import '../../../data/models/movies_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class CarouselSliderItem extends StatelessWidget {
  const CarouselSliderItem({super.key, required this.moviesModel});
  final Movie? moviesModel;

  String changeDateFormate(String date) {
    final DateTime dateTime = DateTime.parse(date);
    final String formattedDate = DateFormat('MMMM d, yyyy').format(dateTime);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    String date = changeDateFormate(moviesModel!.releaseDate!);
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl:
              '${ApiDataHelper.secureBaseUrl + ApiDataHelper.posterSizes.last}${moviesModel!.posterPath}',
          placeholder: (context, url) {
            return Shimmer.fromColors(
              baseColor: AppColors.lineDark,
              highlightColor: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white,
                ),
              ),
            );
          },
          imageBuilder: (context, imageProvider) => Container(
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
              color: AppColors.soft.withOpacity(0.7),
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
    );
  }
}
