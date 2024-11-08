import 'package:cine_rank/core/di/dependency_injection.dart';
import 'package:cine_rank/core/themes/colors.dart';
import 'package:cine_rank/features/home/presentation/widgets/custom_bottom_nav_bar_item.dart';
import 'package:cine_rank/features/movies/presentation/cubit/movies_cubit/movies_cubit.dart';
import 'package:cine_rank/features/movies/presentation/screens/movies_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    BlocProvider(
      create: (context) => MoviesCubit(getIt(), getIt(), getIt(), getIt()),
      child: const MoviesScreen(),
    ),
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];
  List<(IconData, String)> listOfIcons = [
    (Icons.local_movies_rounded, 'Movies'),
    (Icons.tv_rounded, 'Series'),
    (Icons.star_rounded, 'Actors'),
    (Icons.account_circle_rounded, 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: screens[currentIndex],
      ),
      bottomNavigationBar: Container(
        height: 56.h,
        decoration: BoxDecoration(
          color: KColors.dark,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.r),
            topRight: Radius.circular(18.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.7),
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            screens.length,
            (index) {
              return InkWell(
                onTap: () {
                  setState(
                    () {
                      currentIndex = index;
                    },
                  );
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: CustomBottomNavBarItem(
                  selected: currentIndex == index,
                  length: screens.length,
                  icon: listOfIcons[index].$1,
                  label: listOfIcons[index].$2,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
