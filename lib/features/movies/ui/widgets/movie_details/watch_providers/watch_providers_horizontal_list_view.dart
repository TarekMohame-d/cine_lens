import 'package:cine_rank/features/movies/data/models/movie_watch_providers_model.dart';
import 'package:cine_rank/features/movies/ui/widgets/movie_details/watch_providers/watch_providers_horizontal_list_view_item.dart';
import 'package:flutter/material.dart';

class WatchProvidersHorizontalListView extends StatelessWidget {
  const WatchProvidersHorizontalListView(
      {super.key, required this.watchProviders});

  final WatchProvider watchProviders;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: watchProviders.rent!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return WatchProvidersHorizontalListViewItem(
            provider: watchProviders.rent![index],
          );
        },
      ),
    );
  }
}
