import 'package:cine_rank/core/helpers/spacing.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

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
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width / length,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 1500),
            curve: Curves.fastLinearToSlowEaseIn,
            margin: EdgeInsets.only(
              bottom: selected ? 0 : size.width * .029,
              right: size.width * .0422,
              left: size.width * .0422,
            ),
            width: size.width / length,
            height: selected ? size.width * .014 : 0,
            decoration: BoxDecoration(
              color: KColors.blueAccent,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
          ),
          verticalSpace(5),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Icon(
                    icon,
                    size: size.width * .076,
                    color: selected
                        ? KColors.blueAccent
                        : KColors.grey,
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  bottom: selected ? -2 : -20,
                  child: Text(
                    label,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: KTextStyles.font12blueAccentMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
