import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/features/movies/ui/widgets/movie_details/movie_production_companies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/movie_details_model.dart';
import '../../../logic/movies_details_cubit/movies_details_cubit.dart';
import 'cast_and_crew/cast_and_crew.dart';
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
        verticalSpace(24),
        MoviesDetailsOverview(overview: movieDetails.overview!),
        verticalSpace(24),
        CastAndCrew(
          castModel: context.read<MoviesDetailsCubit>().cast,
        ),
        verticalSpace(24),
        MovieProductionCompanies(
          productionCompanies: movieDetails.productionCompanies!,
        )
      ],
    );
  }
}
