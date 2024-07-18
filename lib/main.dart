// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cine_rank/cine_rank_app.dart';
import 'package:cine_rank/core/di/dependency_injection.dart';
import 'package:cine_rank/core/helpers/app_life_cycle_observer.dart';
import 'package:cine_rank/core/helpers/bloc_observer.dart';
import 'package:cine_rank/core/helpers/constants.dart';
import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/helpers/hive_helper.dart';
import 'package:cine_rank/core/helpers/shared_pref_helper.dart';
import 'package:cine_rank/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding.instance.addObserver(AppLifecycleObserver());
  await setupGetIt();
  await HiveHelper.initHive();
  await HiveHelper.openBoxes();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
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
    AppConstants.userId = userId;
  } else {
    isLoggedInUser = false;
  }
}
