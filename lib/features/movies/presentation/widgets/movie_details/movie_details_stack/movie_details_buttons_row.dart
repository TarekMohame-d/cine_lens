// import 'package:cine_rank/core/helpers/extensions.dart';
// import 'package:cine_rank/core/helpers/spacing.dart';
// import 'package:cine_rank/core/routing/routes.dart';
// import 'package:cine_rank/core/themes/colors.dart';
// import 'package:cine_rank/core/themes/text_styles.dart';
// import 'package:cine_rank/core/widgets/app_text_button.dart';
// import 'package:cine_rank/features/movies/data/models/movie_details_model.dart';
// import 'package:cine_rank/features/movies/logic/movies_details_cubit/movies_details_cubit.dart';
// import 'package:cine_rank/features/movies/ui/widgets/movie_details/movie_details_stack/video_player_widget.dart';
// import 'package:cine_rank/features/movies/ui/widgets/movie_details/watch_providers/watch_providers_bottom_sheet.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class MovieDetailsButtonsRow extends StatelessWidget {
//   const MovieDetailsButtonsRow({super.key, required this.movieDetails});

//   final MovieDetailsModel movieDetails;
//   @override
//   Widget build(BuildContext context) {
//     var cubit = context.read<MoviesDetailsCubit>();
//     return Padding(
//       padding: EdgeInsets.only(bottom: 5.0.h),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           AppTextButton(
//             onPressed: () async {
//               await cubit.getMovieVideos(movieId: movieDetails.id!);
//               if (cubit.videoData != null) {
//                 if (context.mounted) {
//                   _showTrailerDialog(context, cubit.videoData!.key!);
//                 }
//               } else {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     duration: Duration(milliseconds: 400),
//                     content: Text(
//                       'No trailers available right now',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 );
//               }
//             },
//             backgroundColor: KColors.blueAccent,
//             borderRadius: 32,
//             buttonWidth: 115.w,
//             child: Row(
//               children: [
//                 const Icon(
//                   Icons.play_arrow_rounded,
//                   color: KColors.white,
//                 ),
//                 horizontalSpace(8),
//                 Text(
//                   'Trailer',
//                   style: KTextStyles.font16WhiteMedium,
//                 ),
//               ],
//             ),
//           ),
//           horizontalSpace(16),
//           InkWell(
//             onTap: () async {
//               await cubit.getMovieWatchProviders(movieId: movieDetails.id!);
//               if (cubit.movieWatchProviderModel?.country?.uS != null) {
//                 showWatchProvidersBottomSheet(
//                   context: context,
//                   watchProvidersList: cubit.watchProviders,
//                 );
//               } else {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     duration: Duration(milliseconds: 400),
//                     content: Text(
//                       'No watch providers available right now',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 );
//               }
//             },
//             borderRadius: BorderRadius.circular(30),
//             child: Container(
//               width: 48.0.w,
//               height: 48.0.h,
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: KColors.soft,
//               ),
//               child: const Icon(
//                 Icons.cast,
//                 color: KColors.blueAccent,
//               ),
//             ),
//           ),
//           horizontalSpace(16),
//           InkWell(
//             onTap: () {
//               if (movieDetails.homepage.isNullOrEmpty()) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     duration: Duration(milliseconds: 400),
//                     content: Text(
//                       'No Website Available right now',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 );
//               } else {
//                 context.pushNamed(
//                   KRoutes.movieDetailsWebView,
//                   arguments: movieDetails.homepage,
//                 );
//               }
//             },
//             borderRadius: BorderRadius.circular(30),
//             child: Container(
//               width: 48.0.w,
//               height: 48.0.h,
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: KColors.soft,
//               ),
//               child: const Icon(
//                 Icons.open_in_new_rounded,
//                 color: KColors.blueAccent,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showTrailerDialog(BuildContext context, String videoUrl) {
//     showDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: YouTubePlayerWidget(videoUrl: videoUrl),
//         );
//       },
//     ).then((_) {
//       // Reset orientation when dialog is dismissed
//       SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     });
//   }
// }
