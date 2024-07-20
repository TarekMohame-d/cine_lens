import 'package:cine_rank/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_colors.dart';

class AppTextField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backGroundColor;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  const AppTextField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.suffixIcon,
    required this.hintText,
    this.backGroundColor,
    this.controller,
    this.prefixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              vertical: 16.h,
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.soft,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.soft,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
        hintStyle: hintStyle ?? AppTextStyles.font14GreySemiBold,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: backGroundColor ?? AppColors.soft,
      ),
      style: AppTextStyles.font14WhiteMedium,
      cursorColor: AppColors.white,
      onChanged: onChanged,
    );
  }
}
