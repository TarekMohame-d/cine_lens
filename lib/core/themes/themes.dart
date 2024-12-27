import 'package:cine_rank/core/themes/custom_themes/app_bar_theme.dart';
import 'package:cine_rank/core/themes/custom_themes/input_decoration_theme.dart';
import 'package:cine_rank/core/themes/custom_themes/snack_bar_theme.dart';
import 'package:cine_rank/core/themes/custom_themes/text_button_theme.dart';
import 'package:cine_rank/core/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class KThemes {
  KThemes._();

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: KColors.black,
    scaffoldBackgroundColor: KColors.scaffoldBackgroundColor,
    fontFamily: 'Montserrat',
    snackBarTheme: KSnackBarTheme.snackBarDarkTheme,
    inputDecorationTheme: KInputDecorationTheme.inputDecorationTheme,
    textButtonTheme: KTextButtonTheme.textButtonDarkTheme,
    textTheme: KTextTheme.darkTextTheme,
    appBarTheme: KAppBarTheme.appBarDarkTheme,
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: KColors.white,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Montserrat',
    snackBarTheme: KSnackBarTheme.snackBarLightTheme,
    textButtonTheme: KTextButtonTheme.textButtonLightTheme,
    textTheme: KTextTheme.lightTextTheme,
    appBarTheme: KAppBarTheme.appBarLightTheme,
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
