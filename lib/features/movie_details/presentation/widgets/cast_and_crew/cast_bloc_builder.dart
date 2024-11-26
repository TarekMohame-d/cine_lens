import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/features/movie_details/presentation/cubit/movies_details_cubit.dart';
import 'package:cine_rank/features/movie_details/presentation/widgets/cast_and_crew/cast_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/themes/text_styles.dart';

class CastBlocBuilder extends StatelessWidget {
  const CastBlocBuilder({super.key, required this.movieId});
  final int movieId;

  @override
  Widget build(BuildContext context) {
    context.read<MoviesDetailsCubit>().getMovieCast(movieId);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
        buildWhen: (previous, current) =>
            current is GetMovieCastLoading ||
            current is GetMovieCastSuccess ||
            current is GetMovieCastFailure,
        builder: (context, state) {
          switch (state) {
            case GetMovieCastSuccess _:
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Cast And Crew',
                        style: KTextStyles.font16WhiteSemiBold,
                      ),
                      const Spacer(),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          // context.pushNamed(KRoutes.movieDetailsCastAndCrewSeeAll,
                          //     arguments: castModel);
                        },
                        child: Text(
                          'See all',
                          style: KTextStyles.font14BlueAccentMedium,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(8),
                  CastListView(castList: state.cast.cast!),
                ],
              );
            case GetMovieCastFailure _:
              return Center(child: Text(state.apiErrorModel.statusMessage!));
            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
