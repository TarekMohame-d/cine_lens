import 'package:cine_lens/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AiringTodayShimmer extends StatelessWidget {
  const AiringTodayShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Shimmer.fromColors(
        baseColor: KColors.grey,
        highlightColor: KColors.white,
        child: Container(
          decoration: BoxDecoration(
            color: KColors.white,
          ),
        ),
      ),
    );
  }
}
