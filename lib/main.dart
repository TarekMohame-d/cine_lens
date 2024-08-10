import 'cine_rank_app.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/bloc_observer.dart';
import 'core/helpers/constants.dart';
import 'core/helpers/data_cache.dart';
import 'core/helpers/extensions.dart';
import 'core/helpers/shared_pref_helper.dart';
import 'core/networking/api_constants.dart';
import 'core/networking/api_services.dart';
import 'core/routing/app_router.dart';
import 'features/login/data/models/user_account_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  localCache = getIt<DataCache>();
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
    localCache.setData(DataCacheKeys.userId, userId);
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
      localCache.setData(
          DataCacheKeys.userAccountData, UserAccountModel.fromJson(response));
      debugPrint('Get user account successfully');
    }
  } catch (error) {
    debugPrint('Error while Getting user account: ${error.toString()}');
  }
}
