import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../data/models/movies_model.dart';
import '../custom_app_bar.dart';
import 'see_all_list_view.dart';

class SeeAllMoviesScreen extends StatefulWidget {
  const SeeAllMoviesScreen({super.key, required this.movies});
  final List<MovieData> movies;

  @override
  State<SeeAllMoviesScreen> createState() => _SeeAllMoviesScreenState();
}

class _SeeAllMoviesScreenState extends State<SeeAllMoviesScreen> {
  List<MovieData> searchList = [];
  @override
  void initState() {
    super.initState();
    searchList.addAll(widget.movies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h),
          child: Column(
            children: [
              CustomAppBar(
                onChanged: (value) {
                  searchList = widget.movies
                      .where((movie) => movie.title!
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                  setState(() {});
                },
              ),
              verticalSpace(12.0),
              Expanded(
                child: SeeAllListView(movies: searchList),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
