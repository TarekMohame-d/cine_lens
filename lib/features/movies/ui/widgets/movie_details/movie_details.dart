import 'package:cine_rank/features/movies/data/models/movie_details_model.dart';
import 'package:cine_rank/features/movies/logic/movies_cubit.dart';
import 'package:cine_rank/features/movies/ui/widgets/movie_details/movie_details_shimmer_loading.dart';
import 'package:cine_rank/features/movies/ui/widgets/movie_details/movie_details_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movieId});
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<MoviesCubit, MoviesState>(
          buildWhen: (previous, current) =>
              current is GetMovieDetailsLoading ||
              current is GetMovieDetailsSuccess ||
              current is GetMovieDetailsFailure,
          builder: (context, state) {
            if (state is GetMovieDetailsLoading) {
              return setupLoading();
            } else if (state is GetMovieDetailsSuccess) {
              return setupSuccess(movieDetails: state.movieDetailsModel);
            } else {
              return const Center(
                child: Text('errror'),
              );
            }
          },
        ),
      ),
    );
  }

  Widget setupLoading() {
    return const MovieDetailsShimmerLoading();
  }

  Widget setupSuccess({required MovieDetailsModel movieDetails}) {
    return MovieDetailsSuccess(
      movieDetails: movieDetails,
    );
  }
}
