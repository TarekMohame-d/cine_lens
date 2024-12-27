import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/core/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class KSnackBarTheme {
  KSnackBarTheme._();

  static final snackBarDarkTheme = SnackBarThemeData(
    backgroundColor: const Color(0xff323232),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    ),
    elevation: 5,
    dismissDirection: DismissDirection.down,
    contentTextStyle: KTextTheme.darkTextTheme.bodyMedium?.copyWith(
      color: KColors.white,
    ),
    behavior: SnackBarBehavior.floating,
  );

  static final snackBarLightTheme = SnackBarThemeData(
    backgroundColor: const Color(0xff323232),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    ),
    elevation: 5,
    contentTextStyle: KTextTheme.lightTextTheme.bodyMedium?.copyWith(
      color: KColors.black,
    ),
    behavior: SnackBarBehavior.floating,
  );
}
