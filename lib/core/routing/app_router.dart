import '../../features/login/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this => arguments as ClassName
    //final arguments = settings.arguments;

    switch (settings.name) {
      // case Routes.onBoardingScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //       create: (context) => OnboardingCubit(getIt())..getAllAPiTeams(),
      //       child: const OnboardingScreen(),
      //     ),
      //   );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      default:
        return null;
    }
  }
}
