import 'package:cine_rank/features/movies/data/models/movie_watch_providers_model.dart';
import 'package:cine_rank/features/movies/ui/widgets/movie_details/watch_providers/watch_providers_vertical_list_view_item.dart';
import 'package:flutter/material.dart';

class WatchProvidersVerticalListView extends StatelessWidget {
  const WatchProvidersVerticalListView({
    super.key,
    required this.watchProvidersList,
  });

  final List<(WatchProvider, String)> watchProvidersList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: watchProvidersList.length,
        itemBuilder: (context, index) {
          return WatchProvidersVerticalListViewItem(
            countryCode: watchProvidersList[index].$2,
            index: index,
            listCount: watchProvidersList.length - 1,
            watchProviders: watchProvidersList[index].$1,
          );
        },
      ),
    );
  }
}
