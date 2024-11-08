// import 'package:cine_rank/features/movies/ui/widgets/movie_details/movie_details_stack/movie_details_app_bar.dart';
// import 'package:cine_rank/features/movies/ui/widgets/movie_details/movie_details_stack/movie_details_background_image.dart';
// import 'package:cine_rank/features/movies/ui/widgets/movie_details/movie_details_stack/movie_details_buttons_row.dart';
// import 'package:cine_rank/features/movies/ui/widgets/movie_details/movie_details_stack/movie_details_movie_image.dart';
// import 'package:cine_rank/features/movies/ui/widgets/movie_details/movie_details_stack/movie_details_rating_row.dart';
// import 'package:flutter/material.dart';

// import '../../../../data/models/movie_details_model.dart';

// class MoviesDetailsStack extends StatelessWidget {
//   const MoviesDetailsStack({
//     super.key,
//     required this.movieDetails,
//   });
  
//   final MovieDetailsModel movieDetails;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * 0.6,
//       width: double.infinity,
//       child: Stack(
//         children: [
//           MovieDetailsBackgroundImage(
//             imageUrl: movieDetails.posterPath!,
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: MovieDetailsMovieImage(
//               imageUrl: movieDetails.posterPath!,
//             ),
//           ),
//           Align(
//             alignment: Alignment.topCenter,
//             child: MovieDetailsAppBar(
//               movieTitle: movieDetails.title!,
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: MovieDetailsRatingRow(
//               movieDetails: movieDetails,
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: MovieDetailsButtonsRow(
//               movieDetails: movieDetails,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
