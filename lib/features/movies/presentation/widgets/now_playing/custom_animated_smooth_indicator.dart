import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/themes/colors.dart';

class CustomAnimatedSmoothIndicator extends StatelessWidget {
  const CustomAnimatedSmoothIndicator({
    super.key,
    required this.activeIndex,
    required this.controller,
    required this.count,
  });

  final int activeIndex;
  final CarouselSliderController controller;
  final int count;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: count,
      effect: ExpandingDotsEffect(
        dotColor: KColors.blueAccent.withValues(alpha: 0.32),
        activeDotColor: KColors.blueAccent,
        dotHeight: 10.h,
        dotWidth: 10.w,
      ),
      onDotClicked: (index) {
        controller.animateToPage(index);
      },
    );
  }
}
