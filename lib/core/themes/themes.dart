import 'package:cine_rank/core/themes/custom_themes/input_decoration_theme.dart';
import 'package:cine_rank/core/themes/custom_themes/snack_bar_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class KThemes {
  KThemes._();

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: KColors.scaffoldBackgroundColor,
    fontFamily: 'Montserrat',
    snackBarTheme: KSnackBarTheme.snackBarDarkTheme,
    inputDecorationTheme: KInputDecorationTheme.inputDecorationTheme,
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
  );

  static void setSystemUiOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: KColors.scaffoldBackgroundColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: KColors.scaffoldBackgroundColor,
        systemNavigationBarDividerColor: KColors.scaffoldBackgroundColor,
      ),
    );
  }
}
