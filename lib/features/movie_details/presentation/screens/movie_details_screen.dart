import 'package:cine_rank/features/movie_details/presentation/cubit/movies_details_cubit.dart';
import 'package:cine_rank/features/movie_details/presentation/widgets/movie_details_shimmer_loading.dart';
import 'package:cine_rank/features/movie_details/presentation/widgets/movie_details_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movieId});
  final int movieId;
  @override
  Widget build(BuildContext context) {
    context.read<MoviesDetailsCubit>().getMovieDetails(movieId);
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
          buildWhen: (previous, current) =>
              current is GetMovieDetailsLoading ||
              current is GetMovieDetailsSuccess ||
              current is GetMovieDetailsFailure,
          builder: (context, state) {
            switch (state) {
              case GetMovieDetailsSuccess _:
                return MovieDetailsSuccess(
                  movieDetails: state.movieDetails,
                );
              case GetMovieDetailsFailure _:
                return Center(
                  child: Text(state.apiErrorModel.statusMessage!),
                );
              default:
                return MovieDetailsShimmerLoading();
            }
          },
        ),
      ),
    );
  }
}
