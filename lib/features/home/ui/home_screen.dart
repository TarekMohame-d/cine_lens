import '../logic/home_cubit.dart';
import 'widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is HomeChangeBottomNavState,
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: context
                .read<HomeCubit>()
                .screens[context.read<HomeCubit>().currentIndex],
          ),
          bottomNavigationBar: const CustomBottomNavBar(),
        );
      },
    );
  }
}
