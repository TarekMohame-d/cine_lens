import 'package:cine_rank/core/helpers/font_weight_helper.dart';
import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBarItem extends StatelessWidget {
  const CustomBottomNavBarItem({
    super.key,
    required this.length,
    required this.selected,
    required this.icon,
    required this.label,
  });

  final int length;
  final bool selected;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width / length,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 1500),
            curve: Curves.fastLinearToSlowEaseIn,
            margin: EdgeInsets.only(
              bottom: selected ? 0 : 5.h,
            ),
            width: (width / length) / 2,
            height: selected ? 5.h : 0,
            decoration: BoxDecoration(
              color: KColors.blueAccent,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
          ),
          verticalSpace(5),
          Icon(
            icon,
            size: width / 13,
            color: selected ? KColors.blueAccent : KColors.grey,
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 1500),
            curve: Curves.fastLinearToSlowEaseIn,
            opacity: selected ? 1 : 0,
            child: Text(
              label,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: KColors.blueAccent,
                    fontWeight: KFontWeightHelper.semiBold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
