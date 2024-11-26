import 'package:cine_rank/core/enums/movies_categories.dart';
import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/text_styles.dart';

class MoviesCategoryAndSeeAll extends StatelessWidget {
  const MoviesCategoryAndSeeAll({
    super.key,
    required this.category,
  });
  final MoviesCategoriesEnum category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: Row(
        children: [
          Text(
            textAlign: TextAlign.start,
            getCategoryName(category),
            style: KTextStyles.font16WhiteSemiBold,
          ),
          const Spacer(),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              context.pushNamed(KRoutes.seeAllMoviesScreen,
                  arguments: category);
            },
            child: Text(
              textAlign: TextAlign.start,
              'See all',
              style: KTextStyles.font14BlueAccentMedium,
            ),
          ),
        ],
      ),
    );
  }

  String getCategoryName(MoviesCategoriesEnum category) {
    switch (category) {
      case MoviesCategoriesEnum.nowPlaying:
        return 'Now Playing';
      case MoviesCategoriesEnum.mostPopular:
        return 'Most Popular';
      case MoviesCategoriesEnum.topRated:
        return 'Top Rated';
      case MoviesCategoriesEnum.upComing:
        return 'Up Comming';
    }
  }
}
