import 'package:cine_rank/core/helpers/debouncer.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/features/search_movies/presentation/cubit/movies_search_cubit.dart';
import 'package:cine_rank/features/search_movies/presentation/widgets/custom_app_bar.dart';
import 'package:cine_rank/features/search_movies/presentation/widgets/search_movies_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesSearchScreen extends StatefulWidget {
  const MoviesSearchScreen({super.key});

  @override
  State<MoviesSearchScreen> createState() => _MoviesSearchScreenState();
}

class _MoviesSearchScreenState extends State<MoviesSearchScreen> {
  late Debouncer _debouncer;

  @override
  void initState() {
    _debouncer = Debouncer(milliseconds: 500);
    super.initState();
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  onSearchChanged(String query) {
    _debouncer.run(() {
      if (query.trim().isNotEmpty) {
        context.read<MoviesSearchCubit>().getSearchMovies(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
          child: Column(
            children: [
              CustomAppBar(
                onChanged: onSearchChanged,
              ),
              verticalSpace(12),
              const Expanded(child: SearchMoviesBlocBuilder()),
            ],
          ),
        ),
      ),
    );
  }
}
