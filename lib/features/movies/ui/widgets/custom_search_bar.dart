import 'package:cine_rank/core/themes/app_colors.dart';
import 'package:cine_rank/core/widgets/app_text_field.dart';
import 'package:cine_rank/features/movies/logic/movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 28.0.h),
      child: AppTextField(
        hintText: 'Search',
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: AppColors.grey,
          size: 24,
        ),
        onChanged: (value) {
          context.read<MoviesCubit>().searchMovies(query: value);
        },
      ),
    );
  }
}
