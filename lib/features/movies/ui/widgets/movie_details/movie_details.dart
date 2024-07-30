import 'package:cine_rank/features/movies/data/models/movie_details_model.dart';
import 'package:cine_rank/features/movies/logic/movies_details_cubit/movies_details_cubit.dart';
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
        child: BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
          buildWhen: (previous, current) =>
              current is GetMovieDetailsAndCastLoading ||
              current is GetMovieDetailsAndCastSuccess ||
              current is GetMovieDetailsAndCastFailure,
          builder: (context, state) {
            var cubit = context.read<MoviesDetailsCubit>();
            if (state is GetMovieDetailsAndCastLoading) {
              return setupLoading();
            } else if (state is GetMovieDetailsAndCastSuccess) {
              return setupSuccess(movieDetails: cubit.movieDetails!);
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
