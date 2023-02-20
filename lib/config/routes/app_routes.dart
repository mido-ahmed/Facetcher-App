import 'package:flutter/material.dart';
import 'package:flutter_starter/features/user-history/presentation/screens/user_history_screen.dart';

import '../../core/utils/app_strings.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/user-profile/presentation/screens/user_profile_screen.dart';

class Routes {
  static const String initial = '/';
  static const String appHome = '/app-home';
  static const String userHistory = '/user-history';
  static const String userProfile = '/user-profile';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (context,) {
          return const SplashScreen();
        }, settings: routeSettings);

      case Routes.appHome:
        return MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        }, settings: routeSettings);

      case Routes.userHistory:
        return MaterialPageRoute(builder: (context) {
          return const UserHistoryScreen();
        }, settings: routeSettings);

      case Routes.userProfile:
        return MaterialPageRoute(builder: (context) {
          return const UserProfileScreen();
        }, settings: routeSettings);

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) =>
        const Scaffold(
          body: Center(
            child: Text(AppStrings.noRouteFound),
          ),
        )));
  }
}
