// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cine_rank/core/helpers/constants.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/themes/app_colors.dart';
import 'package:cine_rank/features/movies/ui/widgets/now_playing/carousel_slider_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
          itemCount: AppConstants.moviesModel!.results!.length > 10
              ? 10
              : AppConstants.moviesModel!.results!.length,
          itemBuilder: (context, index, realIndex) {
            return CarouselSliderItem(
              moviesModel: AppConstants.moviesModel!.results![index],
            );
          },
        ),
        verticalSpace(12),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: AppConstants.moviesModel!.results!.length > 10
              ? 10
              : AppConstants.moviesModel!.results!.length,
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
