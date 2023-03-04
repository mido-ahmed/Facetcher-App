import 'package:flutter/material.dart';
import 'package:flutter_starter/features/drawing-report/presentation/screens/drawing_report_screen.dart';
import 'package:flutter_starter/features/drawing-result/presentation/screens/drawing-result.dart';
import 'package:flutter_starter/features/home-screen/presentation/screen/home_screen.dart';
import 'package:flutter_starter/features/user-history/presentation/screens/user_history_screen.dart';

import '../../core/utils/app_strings.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/user-profile/presentation/screens/user_profile_screen.dart';

class Routes {
  static const String initial = '/';
  static const String appHome = '/app-home';
  static const String drawingScreen = '/app-drawing-screen';
  static const String userHistory = '/user-history';
  static const String userProfile = '/user-profile';
  static const String userDrawingResult = '/user-drawing-result';
  static const String userDrawingReport = '/user-drawing-report';
  static const String userHomeScreen = '/user-home-screen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initial:
        return MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
            settings: routeSettings);

      case Routes.appHome:
        return MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
            settings: routeSettings);

      case Routes.userHistory:
        return MaterialPageRoute(
            builder: (context) {
              return const UserHistoryScreen();
            },
            settings: routeSettings);

      case Routes.userProfile:
        return MaterialPageRoute(
            builder: (context) {
              return const UserProfileScreen();
            },
            settings: routeSettings);

      case Routes.userDrawingResult:
        return MaterialPageRoute(
            builder: (context) {
              return const DrawingResult();
            },
            settings: routeSettings);

      case Routes.userDrawingReport:
        return MaterialPageRoute(
            builder: (context) {
              return const DrawingReport();
            },
            settings: routeSettings);

      case Routes.userHomeScreen:
        return MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
            settings: routeSettings);

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
