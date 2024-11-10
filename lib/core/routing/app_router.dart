import 'package:cine_rank/core/enums/movies_categories.dart';
import 'package:cine_rank/features/home/presentation/screens/home_screen.dart';
import 'package:cine_rank/features/login/presentation/cubit/login_cubit.dart';
import 'package:cine_rank/features/login/presentation/screens/login_screen.dart';
import 'package:cine_rank/features/login/presentation/widgets/login_web_view.dart';
import 'package:cine_rank/features/movies/presentation/cubit/movies_cubit/movies_cubit.dart';
import 'package:cine_rank/features/movies/presentation/screens/see_all_movies_screen.dart';
import 'package:cine_rank/features/search_movies/presentation/cubit/movies_search_cubit.dart';
import 'package:cine_rank/features/search_movies/presentation/screens/movies_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../di/dependency_injection.dart';
import 'routes.dart';

class KAppRouter {
  Route? generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this => arguments as ClassName
    final arguments = settings.arguments;

    switch (settings.name) {
      case KRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case KRoutes.webViewScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(getIt(), getIt(), getIt()),
            child: LoginWebView(),
          ),
        );
      case KRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case KRoutes.seeAllMoviesScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<MoviesCubit>(),
            child: SeeAllMoviesScreen(
              category: arguments as MoviesCategoriesEnum,
            ),
          ),
        );
      // case KRoutes.movieDetailsScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => MoviesDetailsCubit(getIt())
      //         ..getMovieDetailsAndCast(movieId: arguments),
      //       child: MovieDetailsScreen(
      //         movieId: arguments as int,
      //       ),
      //     ),
      //   );
      // case KRoutes.movieDetailsWebView:
      //   return MaterialPageRoute(
      //     builder: (context) => MovieWebView(
      //       webViewUrl: arguments as String,
      //     ),
      //   );
      // case KRoutes.movieDetailsCastAndCrewSeeAll:
      //   return MaterialPageRoute(
      //     builder: (context) => AllCastAndCrewScreen(
      //       castModel: arguments as CastModel,
      //     ),
      //   );
      case KRoutes.moviesSearchScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => MoviesSearchCubit(getIt()),
            child: const MoviesSearchScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
