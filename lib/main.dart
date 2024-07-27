// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cine_rank/cine_rank_app.dart';
import 'package:cine_rank/core/di/dependency_injection.dart';
import 'package:cine_rank/core/helpers/app_life_cycle_observer.dart';
import 'package:cine_rank/core/helpers/bloc_observer.dart';
import 'package:cine_rank/core/helpers/constants.dart';
import 'package:cine_rank/core/helpers/data_cache.dart';
import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/helpers/hive_helper.dart';
import 'package:cine_rank/core/helpers/shared_pref_helper.dart';
import 'package:cine_rank/core/networking/api_constants.dart';
import 'package:cine_rank/core/networking/api_services.dart';
import 'package:cine_rank/core/routing/app_router.dart';
import 'package:cine_rank/features/login/data/models/user_account_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding.instance.addObserver(AppLifecycleObserver());
  await setupGetIt();
  cache = getIt<DataCache>();
  await HiveHelper.initHive();
  await HiveHelper.openBoxes();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  await getUserAccount();
  Bloc.observer = MyBlocObserver();
  runApp(
    CineRankApp(
      appRouter: AppRouter(),
    ),
  );
}

checkIfLoggedInUser() async {
  int? userId = await SharedPrefHelper.getSecuredInt(SharedPrefKeys.userId);
  if (!userId.isNullOrZero()) {
    isLoggedInUser = true;
    cache.setData(DataCacheKeys.userId, userId);
  } else {
    isLoggedInUser = false;
  }
}

Future<void> getUserAccount() async {
  try {
    ApiService apiService = getIt<ApiService>();
    String sessionId =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.sessionId);
    if (!sessionId.isNullOrEmpty()) {
      var response = await apiService.get(
        endPoint: ApiEndPoints.account,
        queryParameters: {
          'session_id': sessionId,
        },
      );
      cache.setData(
          DataCacheKeys.userAccount, UserAccountModel.fromJson(response));
      debugPrint('Get user account successfully');
    }
  } catch (error) {
    debugPrint('Error while Getting user account: ${error.toString()}');
  }
}
