import 'package:cine_rank/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cine_rank_app.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/bloc_observer.dart';
import 'core/helpers/constants.dart';
import 'core/helpers/shared_pref_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  KThemes.setSystemUiOverlayStyle();
  isLoggedIn = await SharedPrefHelper.getInt(SharedPrefKeys.userId) != null;
  Bloc.observer = MyBlocObserver();
  runApp(
    CineRankApp(),
  );
}


// Future<void> getUserAccount() async {
//   try {
//     ApiService apiService = getIt<ApiService>();
//     String sessionId =
//         await SharedPrefHelper.getString(SharedPrefKeys.sessionId);
//     if (!sessionId.isNullOrEmpty()) {
//       var response = await apiService.get(
//         endPoint: ApiEndPoints.account,
//         queryParameters: {
//           'session_id': sessionId,
//         },
//       );
//       localCache.setData(DataCacheKeys.userAccountData,
//           UserAccountDetailsModel.fromJson(response));
//       debugPrint('Get user account successfully');
//     }
//   } catch (error) {
//     debugPrint('Error while Getting user account: ${error.toString()}');
//   }
// }
