import 'package:cine_rank/core/themes/colors.dart';
import 'package:flutter/material.dart';

class KInputDecorationTheme {
  KInputDecorationTheme._();

  static final inputDecorationTheme = InputDecorationTheme(
    isDense: true,
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: KColors.soft,
        width: 1.3,
      ),
      borderRadius: BorderRadius.circular(24),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: KColors.soft,
        width: 1.3,
      ),
      borderRadius: BorderRadius.circular(24),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.3,
      ),
      borderRadius: BorderRadius.circular(24),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.3,
      ),
      borderRadius: BorderRadius.circular(24),
    ),
    filled: true,
    fillColor: KColors.soft,
  );
}
