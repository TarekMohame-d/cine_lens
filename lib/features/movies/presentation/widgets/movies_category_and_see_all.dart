import 'package:cine_lens/core/enums/movies_categories.dart';
import 'package:cine_lens/core/helpers/extensions.dart';
import 'package:cine_lens/core/helpers/font_weight_helper.dart';
import 'package:cine_lens/core/routing/routes.dart';
import 'package:cine_lens/core/themes/colors.dart';
import 'package:cine_lens/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesCategoryAndSeeAll extends StatelessWidget {
  const MoviesCategoryAndSeeAll({
    super.key,
    required this.category,
    this.isSeeAllWorking = true,
    required this.movies,
  });
  final MoviesCategoriesEnum category;
  final List<MovieEntity> movies;
  final bool isSeeAllWorking;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textAlign: TextAlign.start,
          getCategoryName(category),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 16.sp,
                fontWeight: KFontWeightHelper.semiBold,
              ),
        ),
        const Spacer(),
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: isSeeAllWorking
              ? () {
                  context.pushNamed(KRoutes.seeAllMoviesScreen,
                      arguments: (category, movies));
                }
              : null,
          child: Text(
            textAlign: TextAlign.start,
            'See all',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: KColors.blueAccent,
                ),
          ),
        ),
      ],
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
