import 'package:cine_rank/core/helpers/font_weight_helper.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CastShimmer extends StatelessWidget {
  const CastShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Cast And Crew',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: KFontWeightHelper.semiBold,
                  ),
            ),
            const Spacer(),
            Text(
              'See all',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: KColors.grey,
                  ),
            ),
          ],
        ),
        verticalSpace(8),
        SizedBox(
          height: 80.h,
          child: Row(
            children: List.generate(
              2,
              (index) => Padding(
                padding: EdgeInsets.only(right: 8.0.w),
                child: Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: KColors.grey,
                      highlightColor: KColors.white,
                      child: Container(
                        width: 72.0.w,
                        height: 72.0.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: KColors.white,
                        ),
                      ),
                    ),
                    horizontalSpace(3),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          baseColor: KColors.grey,
                          highlightColor: KColors.white,
                          child: Container(
                            width: 72.0.w,
                            height: 12.0.h,
                            color: KColors.white,
                          ),
                        ),
                        verticalSpace(4),
                        Shimmer.fromColors(
                          baseColor: KColors.grey,
                          highlightColor: KColors.white,
                          child: Container(
                            width: 56.0.w,
                            height: 12.0.h,
                            color: KColors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
