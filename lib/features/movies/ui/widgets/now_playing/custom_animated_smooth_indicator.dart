import 'package:carousel_slider/carousel_controller.dart';
import '../../../../../core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomAnimatedSmoothIndicator extends StatelessWidget {
  const CustomAnimatedSmoothIndicator({
    super.key,
    required this.activeIndex,
    required this.controller,
  });

  final int activeIndex;
  final CarouselController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: 10,
      effect: ExpandingDotsEffect(
        dotColor: AppColors.blueAccent.withOpacity(0.32),
        activeDotColor: AppColors.blueAccent,
        dotHeight: 10.h,
        dotWidth: 10.w,
      ),
      onDotClicked: (index) {
        controller.animateToPage(index);
      },
    );
  }
}
