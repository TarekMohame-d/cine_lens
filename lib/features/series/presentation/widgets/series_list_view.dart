import 'package:cine_lens/features/series/domain/entities/series_entity.dart';
import 'package:cine_lens/features/series/presentation/widgets/series_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeriesListView extends StatelessWidget {
  const SeriesListView({super.key, required this.series});

  final List<SeriesEntity> series;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h,
      child: ListView.builder(
        itemCount: series.length > 10 ? 10 : series.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SeriesListViewItem(
            series: series[index],
          );
        },
      ),
    );
  }
}
