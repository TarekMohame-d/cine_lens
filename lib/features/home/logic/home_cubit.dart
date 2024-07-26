import 'package:cine_rank/core/di/dependency_injection.dart';
import 'package:cine_rank/features/movies/logic/movies_cubit.dart';

import '../../actors/ui/actors_screen.dart';
import '../../movies/ui/movies_screen.dart';
import '../../profile/ui/profile_screen.dart';
import '../../series/ui/series_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currentIndex = 0;
  void changeBottomNavIndex(index) {
    currentIndex = index;
    emit(HomeChangeBottomNavState());
  }

  List<IconData> listOfIcons = [
    Icons.movie,
    Icons.tv_outlined,
    Icons.personal_injury,
    Icons.person_rounded,
  ];

  List<String> listOfStrings = [
    'Movies',
    'Series',
    'Actors',
    'Profile',
  ];

  List<Widget> screens = [
    BlocProvider(
      create: (context) => MoviesCubit(getIt())..getMovies(),
      child: const MoviesScreen(),
    ),
    const SeriesScreen(),
    const ActorsScreen(),
    const ProfileScreen(),
  ];
}
