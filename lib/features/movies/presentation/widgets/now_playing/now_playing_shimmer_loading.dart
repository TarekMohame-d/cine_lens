import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/themes/colors.dart';
import 'custom_animated_smooth_indicator.dart';

class NowPlayingShimmerLoading extends StatefulWidget {
  const NowPlayingShimmerLoading({super.key});

  @override
  State<NowPlayingShimmerLoading> createState() =>
      _NowPlayingShimmerLoadingState();
}

class _NowPlayingShimmerLoadingState extends State<NowPlayingShimmerLoading> {
  late CarouselSliderController _controller;
  late int _activeIndex;

  @override
  void initState() {
    super.initState();
    _activeIndex = 0;
    _controller = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          options: CarouselOptions(
            height: 200.0.h,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
            enlargeFactor: 0.25,
            onPageChanged: (index, reason) {
              setState(() {
                _activeIndex = index;
              });
            },
          ),
          itemCount: 10,
          itemBuilder: (context, index, realIndex) {
            return Stack(
              children: [
                Shimmer.fromColors(
                  baseColor: KColors.grey,
                  highlightColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50.0.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      color: KColors.soft.withValues(alpha: 0.7),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 12.0.w,
                        bottom: 6.h,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(
                            baseColor: KColors.grey,
                            highlightColor: Colors.white,
                            child: Container(
                              height: 15.h,
                              width: 180.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: KColors.white,
                              ),
                            ),
                          ),
                          verticalSpace(5),
                          Shimmer.fromColors(
                            baseColor: KColors.grey,
                            highlightColor: Colors.white,
                            child: Container(
                              height: 10.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: KColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        verticalSpace(12),
        CustomAnimatedSmoothIndicator(
          activeIndex: _activeIndex,
          controller: _controller,
          count: 10,
        ),
      ],
    );
  }
}
