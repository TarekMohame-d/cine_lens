import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailsAppBar extends StatelessWidget {
  const MovieDetailsAppBar({super.key, required this.movieTitle});

  final String movieTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.0.h),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
            ),
          ),
          Expanded(
            child: Text(
              textAlign: TextAlign.center,
              movieTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: KTextStyles.font16WhiteSemiBold,
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
            ),
          ),
        ],
      ),
    );
  }
}
