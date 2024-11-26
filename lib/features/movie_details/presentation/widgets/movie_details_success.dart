import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:cine_rank/features/movie_details/presentation/widgets/cast_and_crew/cast_bloc_builder.dart';
import 'package:cine_rank/features/movie_details/presentation/widgets/movie_production_companies.dart';
import 'package:flutter/material.dart';

import 'movie_details_stack/movies_details_stack.dart';
import 'movies_details_overview.dart';

class MovieDetailsSuccess extends StatelessWidget {
  const MovieDetailsSuccess({super.key, required this.movieDetails});
  final MovieDetailsEntity movieDetails;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MoviesDetailsStack(movieDetails: movieDetails),
          verticalSpace(12),
          MoviesDetailsOverview(overview: movieDetails.overview!),
          verticalSpace(12),
          CastBlocBuilder(movieId: movieDetails.id!),
          verticalSpace(12),
          MovieProductionCompanies(
              productionCompanies: movieDetails.productionCompanies!),
        ],
      ),
    );
  }
}
