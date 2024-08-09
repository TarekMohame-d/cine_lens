import 'package:carousel_slider/carousel_slider.dart';
import 'package:cine_rank/features/movies/data/models/movies_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacing.dart';
import 'carousel_slider_item.dart';
import 'custom_animated_smooth_indicator.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({
    super.key,
    required this.nowPlayingMovies,
  });

  final MoviesModel nowPlayingMovies;

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  late int activeIndex;
  late CarouselSliderController controller;

  @override
  void initState() {
    super.initState();
    activeIndex = 0;
    controller = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    int itemCount = widget.nowPlayingMovies.movies!.length > 10
        ? 10
        : widget.nowPlayingMovies.movies!.length;
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
              itemCount: itemCount,
              itemBuilder: (context, index, realIndex) {
                return CarouselSliderItem(
                  moviesModel: widget.nowPlayingMovies.movies![index],
                );
              },
            ),
          ),
          verticalSpace(12),
          CustomAnimatedSmoothIndicator(
            activeIndex: activeIndex,
            controller: controller,
            count: itemCount,
          ),
        ],
      ),
    );
  }
}
