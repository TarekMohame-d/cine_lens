import 'package:cine_lens/core/enums/series_categories.dart';
import 'package:cine_lens/core/helpers/extensions.dart';
import 'package:cine_lens/features/series/domain/entities/series_entity.dart';
import 'package:cine_lens/features/series/presentation/widgets/see_all/series_see_all_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeriesSeeAllScreen extends StatelessWidget {
  const SeriesSeeAllScreen(
      {super.key, required this.series, required this.category});

  final SeriesCategories category;
  final List<SeriesEntity> series;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h),
          child: SeriesSeeAllListView(series: series, category: category),
        ),
      ),
    );
  }
}
