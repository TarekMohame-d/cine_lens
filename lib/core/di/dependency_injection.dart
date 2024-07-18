import 'package:cine_rank/features/login/data/repos/login_repo.dart';
import 'package:cine_rank/features/login/logic/login_cubit.dart';
import 'package:dio/dio.dart';
import '../networking/api_services.dart';
import '../networking/dio_factory.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  // Dio and ApiService

  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio: dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(apiService: getIt()));

  // onBoarding
  // getIt.registerLazySingleton<OnboardingRepo>(
  //     () => OnboardingRepo(apiService: getIt()));
}
