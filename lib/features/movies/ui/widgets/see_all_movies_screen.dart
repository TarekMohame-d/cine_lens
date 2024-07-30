import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/features/movies/data/models/movies_model.dart';
import 'package:cine_rank/features/movies/ui/widgets/custom_app_bar.dart';
import 'package:cine_rank/features/movies/ui/widgets/see_all_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeeAllMoviesScreen extends StatelessWidget {
  const SeeAllMoviesScreen({super.key, required this.movies});
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h),
          child: Column(
            children: [
              CustomAppBar(
                onChanged: (value) {},
              ),
              verticalSpace(12.0),
              Expanded(
                child: SeeAllListView(movies: movies),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
