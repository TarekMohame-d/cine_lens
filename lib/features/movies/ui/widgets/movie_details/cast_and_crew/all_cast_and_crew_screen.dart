import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/themes/app_colors.dart';
import 'package:cine_rank/core/themes/app_text_styles.dart';
import 'package:cine_rank/features/movies/data/models/movie_cast_model.dart';
import 'package:cine_rank/features/movies/ui/widgets/custom_app_bar.dart';
import 'package:cine_rank/features/movies/ui/widgets/movie_details/cast_and_crew/cast_part.dart';
import 'package:cine_rank/features/movies/ui/widgets/movie_details/cast_and_crew/crew_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCastAndCrewScreen extends StatelessWidget {
  const AllCastAndCrewScreen({super.key, required this.castModel});
  final CastModel castModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h),
          child: Column(
            children: [
              CustomAppBar(
                onChanged: (value) {},
              ),
              verticalSpace(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(),
                  Text(
                    'Cast',
                    style: AppTextStyles.font16WhiteMedium,
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    'Crew',
                    style: AppTextStyles.font16WhiteMedium,
                  ),
                  const Spacer(),
                ],
              ),
              verticalSpace(8),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CastPart(
                        cast: castModel.cast!,
                      ),
                    ),
                    VerticalDivider(
                      color: AppColors.grey,
                      thickness: 2,
                      width: 15.0.w,
                    ),
                    Expanded(
                      child: CrewPart(
                        crew: castModel.crew!,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
