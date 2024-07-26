import 'package:cine_rank/core/helpers/extensions.dart';
import 'package:cine_rank/core/routing/routes.dart';
import 'package:cine_rank/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesListsHeader extends StatelessWidget {
  const MoviesListsHeader({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: Row(
        children: [
          Text(
            textAlign: TextAlign.start,
            title,
            style: AppTextStyles.font16WhiteSemiBold,
          ),
          const Spacer(),
          InkWell(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              context.pushNamed(Routes.seeAllMoviesScreen);
            },
            child: Text(
              textAlign: TextAlign.start,
              'See all',
              style: AppTextStyles.font14BlueAccentMedium,
            ),
          ),
        ],
      ),
    );
  }
}
