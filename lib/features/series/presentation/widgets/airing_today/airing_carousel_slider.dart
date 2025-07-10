import 'package:carousel_slider/carousel_slider.dart';
import 'package:cine_lens/features/series/domain/entities/series_entity.dart';
import 'package:cine_lens/features/series/presentation/widgets/airing_today/airing_animated_smooth_indicator.dart';
import 'package:cine_lens/features/series/presentation/widgets/airing_today/airing_carousel_slider_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AiringCarouselSlider extends StatefulWidget {
  const AiringCarouselSlider({super.key, required this.series});

  final List<SeriesEntity> series;

  @override
  State<AiringCarouselSlider> createState() => _AiringCarouselSliderState();
}

class _AiringCarouselSliderState extends State<AiringCarouselSlider> {
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
    int itemCount = widget.series.length > 10 ? 10 : widget.series.length;
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1.0,
            autoPlayInterval: const Duration(seconds: 2),
            height: MediaQuery.sizeOf(context).height * 0.6,
            onPageChanged: (index, reason) {
              setState(() {
                _activeIndex = index;
              });
            },
          ),
          itemCount: itemCount,
          itemBuilder: (context, index, realIndex) {
            return AiringCarouselSliderItem(
              posterPath: widget.series[index].posterPath,
            );
          },
        ),
        Positioned(
          bottom: 10.0.h,
          left: 0,
          right: 0,
          child: Center(
            child: AiringAnimatedSmoothIndicator(
              activeIndex: _activeIndex,
              controller: _controller,
              count: itemCount,
            ),
          ),
        ),
      ],
    );
  }
}
