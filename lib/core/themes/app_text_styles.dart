import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'font_weight_helper.dart';

class AppTextStyles {

  static TextStyle font13WhiteRegular = TextStyle(
    fontSize: 13.0.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.regular,
  );

static TextStyle font14GreySemiBold = TextStyle(
    fontSize: 14.0.sp,
    color: AppColors.grey,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font16WhiteMedium = TextStyle(
    fontSize: 16.0.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.0.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font18WhiteMedium = TextStyle(
    fontSize: 18.0.sp,
    color: AppColors.white,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font13BlueAccentSemiBold = TextStyle(
    fontSize: 13.0.sp,
    color: AppColors.blueAccent,
    fontWeight: FontWeightHelper.semiBold,
  );
  
}
