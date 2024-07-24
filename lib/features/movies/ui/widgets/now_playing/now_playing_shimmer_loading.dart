import 'package:carousel_slider/carousel_slider.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NowPlayingShimmerLoading extends StatefulWidget {
  const NowPlayingShimmerLoading({super.key});

  @override
  State<NowPlayingShimmerLoading> createState() =>
      _NowPlayingShimmerLoadingState();
}

class _NowPlayingShimmerLoadingState extends State<NowPlayingShimmerLoading> {
  late CarouselController controller;
  late int activeIndex;

  @override
  void initState() {
    super.initState();
    activeIndex = 0;
    controller = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          options: CarouselOptions(
            autoPlay: true,
            height: 200.0.h,
            autoPlayInterval: const Duration(seconds: 2),
            enlargeCenterPage: true,
            enlargeFactor: 0.25,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
          itemCount: 10,
          itemBuilder: (context, index, realIndex) {
            return Shimmer.fromColors(
              baseColor: AppColors.grey,
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
        ),
        verticalSpace(12),
        AnimatedSmoothIndicator(
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
        ),
      ],
    );
  }
}
