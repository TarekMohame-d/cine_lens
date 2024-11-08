import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/themes/colors.dart';

class MovieDetailsShimmerLoading extends StatelessWidget {
  const MovieDetailsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: (screenHeight * 0.6).h,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: (screenHeight * 0.6).h,
                width: double.infinity,
                color: KColors.lineDark,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 130.h,
                  ),
                  child: Shimmer.fromColors(
                    baseColor: KColors.grey,
                    highlightColor: Colors.white,
                    child: Container(
                      height: 280.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 28.0.h),
                  child: Shimmer.fromColors(
                    baseColor: KColors.grey,
                    highlightColor: Colors.white,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 70.0.h),
                      height: 20.h,
                      width: 270.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0.w,
                    vertical: 24.0.h,
                  ),
                  child: Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: KColors.soft,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Shimmer.fromColors(
                  baseColor: KColors.grey,
                  highlightColor: Colors.white,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20.0.h),
                    height: 48.h,
                    width: 240.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        verticalSpace(24),
        Shimmer.fromColors(
          baseColor: KColors.grey,
          highlightColor: Colors.white,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24.0.h),
            height: 130.0.h,
            width: (screenWidth * 0.9).w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
          ),
        ),
        verticalSpace(24),
        Shimmer.fromColors(
          baseColor: KColors.grey,
          highlightColor: Colors.white,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24.0.h),
            height: 20.0.h,
            width: (screenWidth * 0.3).w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(left: 24.0.w),
              child: Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: KColors.grey,
                    highlightColor: Colors.white,
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: KColors.grey,
                        highlightColor: Colors.white,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.0.h),
                          height: 17.0.h,
                          width: (screenWidth * 0.2).w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      verticalSpace(4),
                      Shimmer.fromColors(
                        baseColor: KColors.grey,
                        highlightColor: Colors.white,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.0.h),
                          height: 12.0.h,
                          width: (screenWidth * 0.1).w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
