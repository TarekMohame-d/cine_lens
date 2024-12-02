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
    behavior: SnackBarBehavior.floating,
  );

  static final snackBarLightTheme = SnackBarThemeData(
    backgroundColor: const Color(0xff323232),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    ),
    elevation: 5,
    behavior: SnackBarBehavior.floating,
  );
}
