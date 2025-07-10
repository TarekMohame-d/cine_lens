import 'package:cine_lens/core/helpers/spacing.dart';
import 'package:cine_lens/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class SeriesShimmerLoading extends StatelessWidget {
  const SeriesShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(right: 12.0.w),
          width: 300.w,
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
                    children: [
                      Shimmer.fromColors(
                        baseColor: KColors.grey,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 10.h,
                          width: 200.w,
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
                          width: 120.w,
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
    );
  }
}
