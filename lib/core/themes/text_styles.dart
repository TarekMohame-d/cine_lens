import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/font_weight_helper.dart';
import 'colors.dart';

class KTextStyles {
  KTextStyles._();
  static TextStyle font13WhiteRegular = TextStyle(
    fontSize: 13.0.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font12WhiteGreyMedium = TextStyle(
    fontSize: 12.0.sp,
    color: KColors.whiteGrey,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font10GreyMedium = TextStyle(
    fontSize: 10.0.sp,
    color: KColors.grey,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font12GreyMedium = TextStyle(
    fontSize: 12.0.sp,
    color: KColors.grey,
    fontWeight: FontWeightHelper.medium,
  );
  
  static TextStyle font12blueAccentMedium = TextStyle(
    fontSize: 12.0.sp,
    color: KColors.blueAccent,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font14WhiteMedium = TextStyle(
    fontSize: 14.0.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font14WhiteSemiBold = TextStyle(
    fontSize: 14.0.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font14BlueAccentMedium = TextStyle(
    fontSize: 14.0.sp,
    color: KColors.blueAccent,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font14GreySemiBold = TextStyle(
    fontSize: 14.0.sp,
    color: KColors.grey,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font16WhiteMedium = TextStyle(
    fontSize: 16.0.sp,
    color: KColors.white,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.0.sp,
    color: KColors.white,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font18WhiteMedium = TextStyle(
    fontSize: 18.0.sp,
    color: KColors.white,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font13BlueAccentSemiBold = TextStyle(
    fontSize: 13.0.sp,
    color: KColors.blueAccent,
    fontWeight: FontWeightHelper.semiBold,
  );
}