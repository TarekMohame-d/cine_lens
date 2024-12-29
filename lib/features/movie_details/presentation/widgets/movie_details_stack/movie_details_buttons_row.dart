import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/helpers/font_weight_helper.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/routing/routes.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/core/widgets/custom_snack_bar.dart';
import 'package:cine_rank/core/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsButtonsRow extends StatefulWidget {
  const MovieDetailsButtonsRow({
    super.key,
    required this.movieId,
    required this.movieLink,
  });

  final int movieId;
  final String movieLink;

  @override
  State<MovieDetailsButtonsRow> createState() => _MovieDetailsButtonsRowState();
}

class _MovieDetailsButtonsRowState extends State<MovieDetailsButtonsRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          KTextButton(
            onPressed: () {
              context.pushNamed(KRoutes.movieVideoScreen,
                  arguments: widget.movieId);
            },
            backgroundColor: KColors.blueAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.play_arrow_rounded,
                  color: KColors.white,
                ),
                horizontalSpace(8),
                Text(
                  'Trailer',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: KFontWeightHelper.semiBold,
                      ),
                ),
              ],
            ),
          ),
          horizontalSpace(16),
          InkWell(
            onTap: () async {
              await launchMoviePage(context);
            },
            borderRadius: BorderRadius.circular(30.r),
            child: Container(
              width: 48.0.w,
              height: 48.0.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: KColors.soft,
              ),
              child: const Icon(
                Icons.open_in_new_rounded,
                color: KColors.blueAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> launchMoviePage(BuildContext context) async {
    if (!widget.movieLink.isNullOrEmpty()) {
      final Uri uri = Uri.parse(widget.movieLink);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        if (context.mounted) {
          customSnackBar(context, 'Could not launch $widget.movieLink');
        }
      }
    } else {
      customSnackBar(context, 'No Website Available right now');
    }
  }
}
