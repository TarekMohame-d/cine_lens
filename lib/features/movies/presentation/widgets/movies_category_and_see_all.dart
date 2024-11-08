import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/text_styles.dart';

class MoviesCategoryAndSeeAll extends StatelessWidget {
  const MoviesCategoryAndSeeAll({
    super.key,
    required this.category,
    this.movies,
  });
  final String category;
  final List<MovieEntity>? movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: Row(
        children: [
          Text(
            textAlign: TextAlign.start,
            category,
            style: KTextStyles.font16WhiteSemiBold,
          ),
          const Spacer(),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              // if (movies != null) {
              //   context.pushNamed(KRoutes.seeAllMoviesScreen,
              //       arguments: movies);
              // }
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
}
