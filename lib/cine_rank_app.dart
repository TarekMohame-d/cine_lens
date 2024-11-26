import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/constants.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/themes/themes.dart';

class CineRankApp extends StatelessWidget {
  final KAppRouter appRouter;
  const CineRankApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: KThemes.darkTheme,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: isLoggedIn ? KRoutes.homeScreen : KRoutes.loginScreen,
      ),
    );
  }
}
