import 'package:cine_rank/core/enums/movies_categories.dart';
import 'package:cine_rank/features/home/presentation/screens/home_screen.dart';
import 'package:cine_rank/features/login/presentation/cubit/login_cubit.dart';
import 'package:cine_rank/features/login/presentation/screens/login_screen.dart';
import 'package:cine_rank/features/login/presentation/screens/login_web_view.dart';
import 'package:cine_rank/features/movie_details/domain/entities/movie_cast_entity.dart';
import 'package:cine_rank/features/movie_details/presentation/cubit/movies_details_cubit.dart';
import 'package:cine_rank/features/movie_details/presentation/screens/cast_and_crew_screen.dart';
import 'package:cine_rank/features/movie_details/presentation/screens/movie_details_screen.dart';
import 'package:cine_rank/features/movie_details/presentation/screens/video_player_screen.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';
import 'package:cine_rank/features/movies/presentation/cubit/movies_cubit.dart';
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
      case KRoutes.loginWebView:
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
        final (MoviesCategoriesEnum, List<MovieEntity>) args =
            arguments as (MoviesCategoriesEnum, List<MovieEntity>);
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<MoviesCubit>(),
            child: SeeAllMoviesScreen(
              category: args.$1,
              movies: args.$2,
            ),
          ),
        );
      case KRoutes.movieDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => MoviesDetailsCubit(getIt(), getIt(), getIt()),
            child: MovieDetailsScreen(
              movieId: arguments as int,
            ),
          ),
        );
      case KRoutes.movieVideoScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => MoviesDetailsCubit(
              getIt(),
              getIt(),
              getIt(),
            ),
            child: VideoPlayerScreen(
              movieId: arguments as int,
            ),
          ),
        );
      case KRoutes.movieCastAndCrewScreen:
        return MaterialPageRoute(
          builder: (context) => CastAndCrewScreen(
            castAndCrewEntity: arguments as MovieCastAndCrewEntity,
          ),
        );
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
