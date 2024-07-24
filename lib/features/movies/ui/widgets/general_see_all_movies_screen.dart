import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralSeeAllMoviesScreen extends StatelessWidget {
  const GeneralSeeAllMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 24.0.h),
          child: const Column(
            children: [
              Text('Movies List'),
            ],
          ),
        ),
      ),
    );
  }
}
