import 'package:cine_rank/core/helpers/api_data_helper.dart';
import 'package:cine_rank/features/movies/data/models/movie_details_model.dart';
import 'package:cine_rank/features/movies/logic/movies_details_cubit/movies_details_cubit.dart';
import 'package:cine_rank/features/movies/ui/widgets/movie_details/cast_and_crew.dart';
import 'package:cine_rank/features/movies/ui/widgets/movie_details/movies_details_overview.dart';
import 'package:cine_rank/features/movies/ui/widgets/movie_details/movies_details_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsSuccess extends StatelessWidget {
  const MovieDetailsSuccess({super.key, required this.movieDetails});
  final MovieDetailsModel movieDetails;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    String imageUrl = ApiDataHelper.getImageUrl(movieDetails.posterPath!);
    return ListView(
      children: [
        MoviesDetailsStack(
          imageUrl: imageUrl,
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          movieDetails: movieDetails,
        ),
        MoviesDetailsOverview(overview: movieDetails.overview!),
        CastAndCrew(
          castModel: context.read<MoviesDetailsCubit>().cast,
        ),
      ],
    );
  }
}
