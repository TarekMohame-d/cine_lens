import 'package:cine_rank/core/themes/colors.dart';
import 'package:flutter/material.dart';

class KBottomNavBarThem {
  KBottomNavBarThem._();

  static final bottomNavBarDarkTheme = BottomNavigationBarThemeData(
    backgroundColor: KColors.dark,
    selectedItemColor: KColors.blueAccent,
    unselectedItemColor: KColors.whiteGrey,
    elevation: 0,
    type: BottomNavigationBarType.fixed,
  );
}
