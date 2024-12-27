import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/constants.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/themes/themes.dart';

class CineRankApp extends StatelessWidget {
  const CineRankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: KThemes.darkTheme,
        onGenerateRoute: KAppRouter().generateRoute,
        initialRoute: isLoggedIn || isGuest != null
            ? KRoutes.homeScreen
            : KRoutes.loginScreen,
      ),
    );
  }
}
