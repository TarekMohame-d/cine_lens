import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/helpers/font_weight_helper.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/routing/routes.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/features/movie_details/presentation/cubit/movies_details_cubit.dart';
import 'package:cine_rank/features/movie_details/presentation/widgets/cast_and_crew/cast_list_view.dart';
import 'package:cine_rank/features/movie_details/presentation/widgets/cast_and_crew/cast_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CastBlocBuilder extends StatelessWidget {
  const CastBlocBuilder({super.key, required this.movieId});
  final int movieId;

  @override
  Widget build(BuildContext context) {
    context.read<MoviesDetailsCubit>().getMovieCastAndCrew(movieId);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
        buildWhen: (previous, current) =>
            current is GetMovieCastAndCrewLoading ||
            current is GetMovieCastAndCrewSuccess ||
            current is GetMovieCastAndCrewFailure,
        builder: (context, state) {
          switch (state) {
            case GetMovieCastAndCrewSuccess _:
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Cast And Crew',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 16.sp,
                              fontWeight: KFontWeightHelper.semiBold,
                            ),
                      ),
                      const Spacer(),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          context.pushNamed(KRoutes.movieCastAndCrewScreen,
                              arguments: state.castAndCrew);
                        },
                        child: Text(
                          'See all',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: KColors.grey,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(8),
                  CastListView(castList: state.castAndCrew.cast!),
                ],
              );
            case GetMovieCastAndCrewFailure _:
              return Center(
                child: Text(state.apiErrorModel.statusMessage!),
              );
            default:
              return CastShimmer();
          }
        },
      ),
    );
  }
}
