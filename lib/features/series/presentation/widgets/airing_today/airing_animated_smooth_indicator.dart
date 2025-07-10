import 'package:carousel_slider/carousel_controller.dart';
import 'package:cine_lens/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AiringAnimatedSmoothIndicator extends StatelessWidget {
  const AiringAnimatedSmoothIndicator({
    super.key,
    required this.activeIndex,
    required this.count,
    required this.controller,
  });

  final int activeIndex;
  final int count;
  final CarouselSliderController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: count,
      effect: ExpandingDotsEffect(
        dotColor: KColors.blueAccent.withValues(alpha: 0.32),
        activeDotColor: KColors.blueAccent,
        dotHeight: 4.h,
        dotWidth: 8.w,
      ),
      onDotClicked: (index) {
        controller.animateToPage(index);
      },
    );
  }
}
