import 'package:cine_lens/core/enums/series_categories.dart';
import 'package:cine_lens/core/helpers/extensions.dart';
import 'package:cine_lens/core/helpers/font_weight_helper.dart';
import 'package:cine_lens/core/routing/routes.dart';
import 'package:cine_lens/core/themes/colors.dart';
import 'package:cine_lens/features/series/domain/entities/series_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeriesCategoryAndSeeAll extends StatelessWidget {
  const SeriesCategoryAndSeeAll({
    super.key,
    required this.series,
    required this.category,
  });

  final List<SeriesEntity> series;
  final SeriesCategories category;

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
          onTap: series.isNotEmpty
              ? () {
                  context.pushNamed(KRoutes.seeAllSeriesScreen,
                      arguments: (category, series));
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

  String getCategoryName(SeriesCategories category) {
    switch (category) {
      case SeriesCategories.airingToday:
        return 'Airing Today';
      case SeriesCategories.mostPopular:
        return 'Most Popular';
      case SeriesCategories.topRated:
        return 'Top Rated';
      case SeriesCategories.onTheAir:
        return 'On The Air';
    }
  }
}
