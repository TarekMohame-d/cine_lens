import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/themes/colors.dart';

class MoviesShimmerLoading extends StatelessWidget {
  const MoviesShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 12.0.w),
            width: 160.w,
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Shimmer.fromColors(
                    baseColor: KColors.grey,
                    highlightColor: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.r),
                          topRight: Radius.circular(12.r),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.0.w, vertical: 8.0.h),
                    decoration:  BoxDecoration(
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
                        Shimmer.fromColors(
                          baseColor: KColors.grey,
                          highlightColor: Colors.white,
                          child: Container(
                            height: 10.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(3.r),
                              color: KColors.grey,
                            ),
                          ),
                        ),
                        verticalSpace(8),
                        Shimmer.fromColors(
                          baseColor: KColors.grey,
                          highlightColor: Colors.white,
                          child: Container(
                            height: 10.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(3.r),
                              color: KColors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
