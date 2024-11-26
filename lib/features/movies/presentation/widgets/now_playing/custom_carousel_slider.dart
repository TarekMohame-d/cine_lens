import 'package:carousel_slider/carousel_slider.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import 'carousel_slider_item.dart';
import 'custom_animated_smooth_indicator.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({
    super.key,
    required this.movies,
  });

  final List<MovieEntity> movies;

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  late int _activeIndex;
  late CarouselSliderController _controller;

  @override
  void initState() {
    super.initState();
    _activeIndex = 0;
    _controller = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    int itemCount = widget.movies.length > 10 ? 10 : widget.movies.length;
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          options: CarouselOptions(
            height: 200.0.h,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            enlargeCenterPage: true,
            enlargeFactor: 0.25,
            onPageChanged: (index, reason) {
              setState(() {
                _activeIndex = index;
              });
            },
          ),
          itemCount: itemCount,
          itemBuilder: (context, index, realIndex) {
            return CarouselSliderItem(
              movie: widget.movies[index],
            );
          },
        ),
        verticalSpace(12),
        CustomAnimatedSmoothIndicator(
          activeIndex: _activeIndex,
          controller: _controller,
          count: itemCount,
        ),
      ],
    );
  }
}
