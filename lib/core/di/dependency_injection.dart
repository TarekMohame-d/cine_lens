import 'package:cine_rank/features/login/data/repository/login_repo_impl.dart';
import 'package:cine_rank/features/login/domain/repository/login_repo.dart';
import 'package:cine_rank/features/login/domain/usecases/create_request_token_use_case.dart';
import 'package:cine_rank/features/login/domain/usecases/create_session_use_case.dart';
import 'package:cine_rank/features/login/domain/usecases/get_user_id_use_case.dart';
import 'package:cine_rank/features/movie_details/data/repository/movie_details_repo_impl.dart';
import 'package:cine_rank/features/movie_details/domain/usecases/get_movie_cast_use_case.dart';
import 'package:cine_rank/features/movie_details/domain/usecases/get_movie_details_use_case.dart';
import 'package:cine_rank/features/movie_details/domain/usecases/get_movie_video_use_case.dart';
import 'package:cine_rank/features/movies/domain/repository/movies_repo.dart';
import 'package:cine_rank/features/movies/domain/usecases/get_most_popular_movies_use_case.dart';
import 'package:cine_rank/features/movies/domain/usecases/get_now_playing_movies_use_case.dart';
import 'package:cine_rank/features/movies/domain/usecases/get_top_rated_movies_use_case.dart';
import 'package:cine_rank/features/movies/domain/usecases/get_upcoming_movies_use_case.dart';
import 'package:cine_rank/features/movies/presentation/cubit/movies_cubit.dart';
import 'package:cine_rank/features/search_movies/data/repository/search_movie_repo_impl.dart';
import 'package:cine_rank/features/search_movies/domain/repository/search_movie_repo.dart';
import 'package:cine_rank/features/search_movies/domain/usecases/search_movie_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/movie_details/domain/repository/movie_details_repo.dart';
import '../../features/movies/data/repository/movies_repo_impl.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  // Dio and ApiService
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepoImpl(getIt()));
  getIt.registerLazySingleton<CreateRequestTokenUseCase>(
      () => CreateRequestTokenUseCase(getIt()));
  getIt.registerLazySingleton<CreateSessionUseCase>(
      () => CreateSessionUseCase(getIt()));
  getIt
      .registerLazySingleton<GetUserIdUseCase>(() => GetUserIdUseCase(getIt()));

  // movies
  getIt.registerLazySingleton<MoviesRepo>(() => MoviesRepoImpl());
  getIt.registerLazySingleton<GetNowPlayingMoviesUseCase>(
      () => GetNowPlayingMoviesUseCase(getIt()));
  getIt.registerLazySingleton<GetMostPopularMoviesUseCase>(
      () => GetMostPopularMoviesUseCase(getIt()));
  getIt.registerLazySingleton<GetUpcomingMoviesUseCase>(
      () => GetUpcomingMoviesUseCase(getIt()));
  getIt.registerLazySingleton<GetTopRatedMoviesUseCase>(
      () => GetTopRatedMoviesUseCase(getIt()));

  // movies search
  getIt.registerLazySingleton<SearchMovieRepo>(() => SearchMovieRepoImpl());
  getIt.registerLazySingleton<SearchMovieUseCase>(
      () => SearchMovieUseCase(getIt()));

  // movies cubit
  getIt.registerFactory<MoviesCubit>(
      () => MoviesCubit(getIt(), getIt(), getIt(), getIt()));

  // movies details
  getIt.registerLazySingleton<MovieDetailsRepo>(() => MovieDetailsRepoImpl());
  getIt.registerLazySingleton<GetMovieDetailsUseCase>(
      () => GetMovieDetailsUseCase(getIt()));
  getIt.registerLazySingleton<GetMovieVideoUseCase>(
      () => GetMovieVideoUseCase(getIt()));
  getIt.registerLazySingleton<GetMovieCastUseCase>(
      () => GetMovieCastUseCase(getIt()));
}
