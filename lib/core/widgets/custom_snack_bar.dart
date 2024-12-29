import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void customSnackBar(BuildContext context, String message,
    [Duration duration = const Duration(seconds: 2)]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: duration,
      margin: EdgeInsets.symmetric(horizontal: 12.w),
    ),
  );
}
