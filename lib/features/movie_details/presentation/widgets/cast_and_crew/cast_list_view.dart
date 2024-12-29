import 'package:cine_rank/core/widgets/conditional_builder.dart';
import 'package:cine_rank/features/movie_details/data/models/movie_cast_model.dart';
import 'package:cine_rank/features/movie_details/presentation/widgets/cast_and_crew/cast_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CastListView extends StatelessWidget {
  const CastListView({super.key, required this.castList});

  final List<Cast> castList;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      fallback: SizedBox(
        height: 80.0.h,
        child: Center(
          child: Text(
            'No cast available',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
      widget: SizedBox(
        height: 80.0.h,
        child: ListView.builder(
          itemCount: castList.length > 10 ? 10 : castList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CastListViewItem(
              cast: castList[index],
            );
          },
        ),
      ),
      condition: castList.isNotEmpty,
    );
  }
}
