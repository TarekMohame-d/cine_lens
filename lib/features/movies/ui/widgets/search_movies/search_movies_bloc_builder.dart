import 'package:cine_rank/core/themes/app_colors.dart';
import 'package:cine_rank/core/themes/app_text_styles.dart';
import 'package:cine_rank/features/movies/data/models/movies_model.dart';
import 'package:cine_rank/features/movies/logic/movies_search_cubit/movies_search_cubit.dart';
import 'package:cine_rank/features/movies/ui/widgets/see_all_movies/see_all_list_view_item.dart';
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
            return setupSuccess(searchMovies: state.moviesModel);
          case MoviesSearchFailure _:
            return setupError(state.errorModel.statusMessage ?? 'Unknown error',
                MediaQuery.of(context).size.width);
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  Widget setupLoading() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.blueAccent,
      ),
    );
  }

  Widget setupSuccess({required MoviesModel searchMovies}) {
    if (searchMovies.movies!.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: Text(
            'No movies found',
            style: AppTextStyles.font16WhiteSemiBold,
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: ListView.builder(
        itemCount: searchMovies.movies!.length,
        itemBuilder: (context, index) {
          return SeeAllListViewItem(movie: searchMovies.movies![index]);
        },
      ),
    );
  }

  Widget setupError(String errorMessage, double screenWidth) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Container(
          height: 230.0.h,
          width: screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.soft,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                errorMessage,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.font16WhiteSemiBold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
