import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/core/themes/text_styles.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';
import 'package:cine_rank/features/movies/presentation/widgets/see_all_movies/see_all_list_view_item.dart';
import 'package:cine_rank/features/search_movies/presentation/cubit/movies_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchMoviesBlocBuilder extends StatelessWidget {
  const SearchMoviesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesSearchCubit, MoviesSearchState>(
      buildWhen: (previous, current) =>
          current is MoviesSearchLoading ||
          current is MoviesSearchSuccess ||
          current is MoviesSearchFailure,
      builder: (context, state) {
        switch (state) {
          case MoviesSearchLoading _:
            return setupLoading();
          case MoviesSearchSuccess _:
            return setupSuccess(state.searchMovies);
          case MoviesSearchFailure _:
            return setupError(state.errorModel.statusMessage ?? 'Unknown error',
                MediaQuery.of(context).size.width);
          default:
            return SizedBox.shrink();
        }
      },
    );
  }

  Widget setupLoading() {
    return const Center(
      child: CircularProgressIndicator(
        color: KColors.blueAccent,
      ),
    );
  }

  Widget setupSuccess(List<MovieEntity> searchMovies) {
    if (searchMovies.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: Text(
            'No movies found',
            style: KTextStyles.font16WhiteSemiBold,
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: ListView.builder(
        itemCount: searchMovies.length,
        itemBuilder: (context, index) {
          return SeeAllListViewItem(movie: searchMovies[index]);
        },
      ),
    );
  }

  Widget setupError(String errorMessage, double screenWidth) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
        child: Container(
          height: 230.0.h,
          width: screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: KColors.soft,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                errorMessage,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: KTextStyles.font16WhiteSemiBold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
