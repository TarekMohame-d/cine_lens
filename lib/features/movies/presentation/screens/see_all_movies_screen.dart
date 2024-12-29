import 'package:cine_rank/core/enums/movies_categories.dart';
import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/features/movies/domain/entities/movie_entity.dart';
import 'package:cine_rank/features/movies/presentation/widgets/see_all/see_all_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeeAllMoviesScreen extends StatelessWidget {
  const SeeAllMoviesScreen(
      {super.key, required this.category, required this.movies});
  final MoviesCategoriesEnum category;
  final List<MovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h),
          child: Column(
            children: [
              Expanded(
                child: SeeAllListView(
                  category: category,
                  movies: movies,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
