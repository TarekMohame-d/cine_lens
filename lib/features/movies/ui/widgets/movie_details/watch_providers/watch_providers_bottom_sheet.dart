import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/themes/app_colors.dart';
import 'package:cine_rank/features/movies/data/models/movie_watch_providers_model.dart';
import 'package:cine_rank/features/movies/ui/widgets/movie_details/watch_providers/watch_providers_vertical_list_view.dart';
import 'package:flutter/material.dart';

Future<dynamic> showWatchProvidersBottomSheet({
  required BuildContext context,
  required List<(WatchProvider, String)> watchProvidersList,
}) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: screenHeight * 0.6,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: AppColors.dark,
        ),
        child: Column(
          children: [
            verticalSpace(12),
            Divider(
              color: AppColors.grey,
              thickness: 2.5,
              indent: screenWidth * 0.45,
              endIndent: screenWidth * 0.45,
            ),
            verticalSpace(12),
            WatchProvidersVerticalListView(
              watchProvidersList: watchProvidersList,
            ),
          ],
        ),
      );
    },
  );
}
