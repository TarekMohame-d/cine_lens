import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/core/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class KTextButtonTheme {
  KTextButtonTheme._();

  static final textButtonLightTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: KColors.blueAccent,
      textStyle: KTextTheme.lightTextTheme.labelLarge,
      foregroundColor: KColors.white,
    ),
  );

  static final textButtonDarkTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: KColors.blueAccent,
      textStyle: KTextTheme.darkTextTheme.labelLarge,
      foregroundColor: KColors.white,
    ),
  );
}
