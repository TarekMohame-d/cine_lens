import 'package:cine_lens/core/enums/series_categories.dart';
import 'package:cine_lens/core/helpers/extensions.dart';
import 'package:cine_lens/core/themes/colors.dart';
import 'package:cine_lens/features/series/domain/entities/series_entity.dart';
import 'package:cine_lens/features/series/presentation/cubit/series_cubit.dart';
import 'package:cine_lens/features/series/presentation/widgets/see_all/series_see_all_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeriesSeeAllListView extends StatefulWidget {
  const SeriesSeeAllListView(
      {super.key, required this.series, required this.category});

  final SeriesCategories category;
  final List<SeriesEntity> series;

  @override
  State<SeriesSeeAllListView> createState() => _SeriesSeeAllListViewState();
}

class _SeriesSeeAllListViewState extends State<SeriesSeeAllListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Scroll listener
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        await context.read<SeriesCubit>().getMoreSeries(widget.category).then(
          (value) {
            widget.series.clear();
            widget.series.addAll(value);
          },
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SeriesCubit, SeriesState>(
      listenWhen: (previous, current) =>
          current is FetchMoreSeriesLoading || current is FetchMoreSeries,
      listener: (context, state) {
        if (state is FetchMoreSeriesLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                color: KColors.blueAccent,
              ),
            ),
          );
        } else if (state is FetchMoreSeries) {
          context.pop();
        }
      },
      buildWhen: (previous, current) => current is FetchMoreSeries,
      builder: (context, state) {
        return ListView.builder(
          controller: _scrollController,
          itemCount: widget.series.length,
          itemBuilder: (context, index) {
            return SeriesSeeAllListViewItem(
              series: widget.series[index],
            );
          },
        );
      },
    );
  }
}
