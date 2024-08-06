import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../data/models/movies_model.dart';

class MoviesListsTitleAndSeeAll extends StatelessWidget {
  const MoviesListsTitleAndSeeAll({
    super.key,
    required this.title,
    this.movies,
  });
  final String title;
  final List<Movie>? movies;

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
          InkWell(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              if (movies != null) {
                context.pushNamed(Routes.seeAllMoviesScreen, arguments: movies);
              }
            },
            child: Text(
              textAlign: TextAlign.start,
              'See all',
              style: AppTextStyles.font14BlueAccentMedium,
            ),
          ),
        ],
      ),
    );
  }
}
