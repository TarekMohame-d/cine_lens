import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/themes/colors.dart';

class MoviesShimmerLoading extends StatelessWidget {
  const MoviesShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12.0.w),
      height: 260.h,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 12.0.w),
            width: 150.w,
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
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 8.0.w,
                      top: 8.0.h,
                      bottom: 8.0.h,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
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
                              borderRadius: BorderRadius.circular(3),
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
                              borderRadius: BorderRadius.circular(3),
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
