import 'package:cine_rank/features/movies/data/models/movie_cast_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/actors/ui/actors_screen.dart';
import '../../features/home/logic/home_cubit.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/login/logic/login_cubit.dart';
import '../../features/login/ui/login_screen.dart';
import '../../features/login/ui/widgets/login_web_view.dart';
import '../../features/movies/data/models/movies_model.dart';
import '../../features/movies/logic/movies_details_cubit/movies_details_cubit.dart';
import '../../features/movies/ui/movies_screen.dart';
import '../../features/movies/ui/widgets/movie_details/cast_and_crew/all_cast_and_crew_screen.dart';
import '../../features/movies/ui/widgets/movie_details/movie_details_screen.dart';
import '../../features/movies/ui/widgets/movie_details/movie_web_view.dart';
import '../../features/movies/ui/widgets/see_all_movies/see_all_movies_screen.dart';
import '../../features/profile/ui/profile_screen.dart';
import '../../features/series/ui/series_screen.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this => arguments as ClassName
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(getIt())..getRequestToken(),
            child: const LoginScreen(),
          ),
        );
      case Routes.webViewScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(getIt()),
            child: LoginWebView(
              requestToken: arguments as String,
            ),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomeScreen(),
          ),
        );
      case Routes.moviesScreen:
        return MaterialPageRoute(
          builder: (context) => const MoviesScreen(),
        );
      case Routes.seriesScreen:
        return MaterialPageRoute(
          builder: (context) => const SeriesScreen(),
        );
      case Routes.actorsScreen:
        return MaterialPageRoute(
          builder: (context) => const ActorsScreen(),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      case Routes.seeAllMoviesScreen:
        return MaterialPageRoute(
          builder: (context) => SeeAllMoviesScreen(
            movies: arguments as List<Movie>,
          ),
        );
      case Routes.movieDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => MoviesDetailsCubit(getIt())
              ..getMovieDetailsAndCast(movieId: arguments),
            child: MovieDetailsScreen(
              movieId: arguments as int,
            ),
          ),
        );
      case Routes.movieDetailsWebView:
        return MaterialPageRoute(
          builder: (context) => MovieWebView(
            webViewUrl: arguments as String,
          ),
        );
      case Routes.movieDetailsCastAndCrewSeeAll:
        return MaterialPageRoute(
          builder: (context) => AllCastAndCrewScreen(
            castModel: arguments as CastModel,
          ),
        );
      default:
        return null;
    }
  }
}
