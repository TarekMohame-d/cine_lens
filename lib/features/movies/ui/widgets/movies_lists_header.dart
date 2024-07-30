import 'package:cine_rank/features/movies/data/models/movies_model.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesListsHeader extends StatelessWidget {
  const MoviesListsHeader({
    super.key,
    required this.title,
    this.dataLoaded = false,
    required this.movies,
  });
  final String title;
  final bool dataLoaded;
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
              if (dataLoaded) {
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
