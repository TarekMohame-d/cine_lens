import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailsAppBar extends StatelessWidget {
  const MovieDetailsAppBar({super.key, required this.movieTitle});

  final String movieTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 24.0.h),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: KColors.soft,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 8,
            child: Text(
              textAlign: TextAlign.center,
              movieTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: KTextStyles.font16WhiteSemiBold,
            ),
          ),
          const Spacer(),
          Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: KColors.soft,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
