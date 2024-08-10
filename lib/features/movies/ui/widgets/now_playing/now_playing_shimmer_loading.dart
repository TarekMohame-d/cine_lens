import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/themes/app_colors.dart';
import 'custom_animated_smooth_indicator.dart';

class NowPlayingShimmerLoading extends StatefulWidget {
  const NowPlayingShimmerLoading({super.key});

  @override
  State<NowPlayingShimmerLoading> createState() =>
      _NowPlayingShimmerLoadingState();
}

class _NowPlayingShimmerLoadingState extends State<NowPlayingShimmerLoading> {
  late CarouselSliderController controller;
  late int activeIndex;

  @override
  void initState() {
    super.initState();
    activeIndex = 0;
    controller = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.0.h,
      child: Column(
        children: [
          Expanded(
            child: CarouselSlider.builder(
              carouselController: controller,
              options: CarouselOptions(
                autoPlay: true,
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
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpace(12),
          CustomAnimatedSmoothIndicator(
            activeIndex: activeIndex,
            controller: controller,
            count: 10,
          ),
        ],
      ),
    );
  }
}
