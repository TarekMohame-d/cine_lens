import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_cast_entity.dart';
import 'package:cine_rank/features/movie_details/presentation/widgets/cast_and_crew/cast_grid_view.dart';
import 'package:cine_rank/features/movie_details/presentation/widgets/cast_and_crew/crew_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CastAndCrewScreen extends StatelessWidget {
  const CastAndCrewScreen({super.key, required this.castAndCrewEntity});
  final MovieCastAndCrewEntity castAndCrewEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: DefaultTabController(
            length: 2,
            child: Column(
              spacing: 12.h,
              children: [
                TabBar(
                  labelStyle: Theme.of(context).textTheme.titleMedium,
                  dividerColor: Colors.transparent,
                  indicatorColor: KColors.blueAccent,
                  unselectedLabelColor: KColors.grey,
                  enableFeedback: true,
                  splashBorderRadius: BorderRadius.zero,
                  splashFactory: NoSplash.splashFactory,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      text: 'Cast',
                    ),
                    Tab(
                      text: 'Crew',
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 3.0.w),
                        child: CastGridView(cast: castAndCrewEntity.cast!),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 3.0.w),
                        child: CrewGridView(crew: castAndCrewEntity.crew!),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
