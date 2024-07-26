import 'package:carousel_slider/carousel_slider.dart';
import 'package:cine_rank/core/helpers/constants.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/features/movies/ui/widgets/now_playing/carousel_slider_item.dart';
import 'package:cine_rank/features/movies/ui/widgets/now_playing/custom_animated_smooth_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({
    super.key,
  });

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  late int activeIndex;
  late CarouselController controller;

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
            return CarouselSliderItem(
              moviesModel: AppConstants.nowPlayingMovies!.results![index],
            );
          },
        ),
        verticalSpace(12),
        CustomAnimatedSmoothIndicator(
          activeIndex: activeIndex,
          controller: controller,
        ),
      ],
    );
  }
}
