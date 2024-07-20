import 'package:cine_rank/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesListsHeader extends StatelessWidget {
  const MoviesListsHeader({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: Row(
        children: [
          Text(
            textAlign: TextAlign.start,
            title,
            style: AppTextStyles.font16WhiteSemiBold,
          ),
          const Spacer(),
          Text(
            textAlign: TextAlign.start,
            'See all',
            style: AppTextStyles.font14BlueAccentMedium,
          ),
        ],
      ),
    );
  }
}
