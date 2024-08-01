import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/movie_details_model.dart';
import '../../../logic/movies_details_cubit/movies_details_cubit.dart';
import 'cast_and_crew.dart';
import 'movie_details_stack/movies_details_stack.dart';
import 'movies_details_overview.dart';

class MovieDetailsSuccess extends StatelessWidget {
  const MovieDetailsSuccess({super.key, required this.movieDetails});
  final MovieDetailsModel movieDetails;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MoviesDetailsStack(
          movieDetails: movieDetails,
        ),
        MoviesDetailsOverview(overview: movieDetails.overview!),
        CastAndCrew(
          castModel: context.read<MoviesDetailsCubit>().cast,
        ),
        //todo: add similar movies
        //todo: add production_companies
      ],
    );
  }
}
