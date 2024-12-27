import 'package:cine_rank/core/helpers/font_weight_helper.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KTextTheme {
  KTextTheme._();

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32.sp,
      fontWeight: KFontWeightHelper.bold,
      color: KColors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 26.sp,
      fontWeight: KFontWeightHelper.bold,
      color: KColors.white,
    ),
    headlineSmall: TextStyle(
      fontSize: 24.sp,
      fontWeight: KFontWeightHelper.bold,
      color: KColors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 22.sp,
      fontWeight: KFontWeightHelper.bold,
      color: KColors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 20.sp,
      fontWeight: KFontWeightHelper.semiBold,
      color: KColors.white,
    ),
    titleSmall: TextStyle(
      fontSize: 18.sp,
      fontWeight: KFontWeightHelper.medium,
      color: KColors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: KFontWeightHelper.semiBold,
      color: KColors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: KFontWeightHelper.medium,
      color: KColors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: KFontWeightHelper.regular,
      color: KColors.white,
    ),
    labelLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: KFontWeightHelper.semiBold,
      color: KColors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: KFontWeightHelper.medium,
      color: KColors.white,
    ),
    labelSmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: KFontWeightHelper.regular,
      color: KColors.white,
    ),
  );

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32.sp,
      fontWeight: KFontWeightHelper.bold,
      color: KColors.black,
    ),
    headlineMedium: TextStyle(
      fontSize: 26.sp,
      fontWeight: KFontWeightHelper.bold,
      color: KColors.black,
    ),
    headlineSmall: TextStyle(
      fontSize: 24.sp,
      fontWeight: KFontWeightHelper.bold,
      color: KColors.black,
    ),
    titleLarge: TextStyle(
      fontSize: 22.sp,
      fontWeight: KFontWeightHelper.bold,
      color: KColors.black,
    ),
    titleMedium: TextStyle(
      fontSize: 20.sp,
      fontWeight: KFontWeightHelper.semiBold,
      color: KColors.black,
    ),
    titleSmall: TextStyle(
      fontSize: 18.sp,
      fontWeight: KFontWeightHelper.medium,
      color: KColors.black,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: KFontWeightHelper.semiBold,
      color: KColors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: KFontWeightHelper.medium,
      color: KColors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: KFontWeightHelper.regular,
      color: KColors.black,
    ),
    labelLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: KFontWeightHelper.semiBold,
      color: KColors.black,
    ),
    labelMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: KFontWeightHelper.medium,
      color: KColors.black,
    ),
    labelSmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: KFontWeightHelper.regular,
      color: KColors.black,
    ),
  );
}
