import 'package:cine_rank/core/di/dependency_injection.dart';
import 'package:cine_rank/features/home/ui/home_screen.dart';
import 'package:cine_rank/features/login/logic/login_cubit.dart';
import 'package:cine_rank/features/login/ui/widgets/login_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/login/ui/login_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this => arguments as ClassName
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(getIt())..getRequestToken(),
            child: const LoginScreen(),
          ),
        );
      case Routes.webViewScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(getIt()),
            child: LoginWebView(
              requestToken: arguments as String,
            ),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return null;
    }
  }
}
