import 'package:cine_rank/features/movies/data/repos/movies_search_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/login/data/repos/login_repo.dart';
import '../../features/movies/data/repos/movies_details_repo.dart';
import '../../features/movies/data/repos/movies_repo.dart';
import '../helpers/data_cache.dart';
import '../networking/api_services.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  // Dio and ApiService

  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio: dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(apiService: getIt()));

  // movies
  getIt
      .registerLazySingleton<MoviesRepo>(() => MoviesRepo(apiService: getIt()));

  // movies details
  getIt.registerLazySingleton<MoviesDetailsRepo>(
      () => MoviesDetailsRepo(apiService: getIt()));

  // movies search
  getIt.registerLazySingleton<MoviesSearchRepo>(
      () => MoviesSearchRepo(apiService: getIt()));

  // DataCache
  getIt.registerSingleton<DataCache>(DataCache());
}
