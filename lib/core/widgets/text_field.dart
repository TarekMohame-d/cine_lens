import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../themes/text_styles.dart';

class KTextField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backGroundColor;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const KTextField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.suffixIcon,
    this.hintText,
    this.backGroundColor,
    this.controller,
    this.prefixIcon,
    this.onChanged,
    this.labelText, this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding,
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,
        hintStyle: hintStyle ?? KTextStyles.font12GreyMedium,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: backGroundColor,
        labelText: labelText,
        labelStyle: labelStyle ?? KTextStyles.font12GreyMedium,
      ),
      style: inputTextStyle ?? KTextStyles.font12WhiteGreyMedium,
      cursorColor: KColors.grey,
      onChanged: onChanged,
    );
  }
}
