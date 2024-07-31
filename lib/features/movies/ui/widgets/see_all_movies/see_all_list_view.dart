import '../../../data/models/movies_model.dart';
import 'see_all_list_view_item.dart';
import 'package:flutter/material.dart';

class SeeAllListView extends StatelessWidget {
  const SeeAllListView({super.key, required this.movies});
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return SeeAllListViewItem(movie: movies[index]);
      },
    );
  }
}
