import 'package:cine_rank/core/enums/movies_categories.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/core/themes/text_styles.dart';
import 'package:cine_rank/features/movies/presentation/widgets/movies_category_and_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesErrorWidget extends StatelessWidget {
  const MoviesErrorWidget({
    super.key,
    required this.errorMessage,
    required this.category,
  });

  final String errorMessage;
  final MoviesCategoriesEnum category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MoviesCategoryAndSeeAll(
          category: category,
        ),
        verticalSpace(12),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Container(
            height: 200.0.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: KColors.soft,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  errorMessage,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: KTextStyles.font16WhiteSemiBold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
