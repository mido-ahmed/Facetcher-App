import 'package:facetcher/features/app-get-started/presentation/screens/intro_data_screen.dart';
import 'package:facetcher/features/app-get-started/presentation/screens/intro_draw_screen.dart';
import 'package:facetcher/features/app-get-started/presentation/screens/intro_permissions_screen.dart';
import 'package:facetcher/features/app-get-started/presentation/screens/intro_start_screen.dart';
import 'package:facetcher/features/app-report-problem/presentation/screens/report_problem.dart';
import 'package:facetcher/features/drawing-result/presentation/screens/drawing_result_screen.dart';
import 'package:facetcher/features/user-change-password/presentation/screens/user_change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:facetcher/features/drawing-report/presentation/screens/drawing_report_screen.dart';
import 'package:facetcher/features/app-home-screen/presentation/screen/home_screen.dart';
import 'package:facetcher/features/user-history/presentation/screens/user_history_screen.dart';

import '../../core/utils/app_strings.dart';
import '../../features/app-signin/presentation/screens/signin_screen.dart';
import '../../features/app-splash/presentation/screens/splash_screen.dart';
import '../../features/drawing-details/presentation/screens/drawing_details_screen.dart';
import '../../features/drawing-screen/presentation/screen/drawing_screen.dart';
import '../../features/user-history-details/presentation/screens/user_history_details_screen.dart';
import '../../features/user-profile/presentation/screens/user_profile_screen.dart';

class Routes {
  static const String initial = '/';
  static const String appHome = '/app-home';
  static const String appSignin = '/app-signin';

  static const String userProfile = '/user-profile';
  static const String userChangePassword = '/user-change-password';
  static const String userHistory = '/user-history';
  static const String userHistoryDetails = '/user-history-details';

  static const String appDrawingScreen = '/app-drawing-screen';
  static const String appDrawingResult = '/app-drawing-result';
  static const String appDrawingReport = '/app-drawing-report';
  static const String appDrawingDetails = '/app-drawing-details';
  static const String appReportProblem = '/app-report-problem';

  static const String appIntroStartScreen = '/app-intro-start';
  static const String appIntroDrawScreen = '/app-intro-draw';
  static const String appIntroDataScreen = '/app-intro-data';
  static const String appIntroPermissionsScreen = '/app-intro-permission';
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

      case Routes.appIntroStartScreen:
        return MaterialPageRoute(
            builder: (context) {
              return const IntroStartScreen();
            },
            settings: routeSettings);

      case Routes.appReportProblem:
        return MaterialPageRoute(
            builder: (context) {
              return const ReportProblemScreen();
            },
            settings: routeSettings);

      case Routes.appIntroDrawScreen:
        return MaterialPageRoute(
            builder: (context) {
              return const IntroDrawScreen();
            },
            settings: routeSettings);

      case Routes.appIntroDataScreen:
        return MaterialPageRoute(
            builder: (context) {
              return const IntroDataScreen();
            },
            settings: routeSettings);

      case Routes.appIntroPermissionsScreen:
        return MaterialPageRoute(
            builder: (context) {
              return const IntroPermissionScreen();
            },
            settings: routeSettings);

      case Routes.appSignin:
        return MaterialPageRoute(
            builder: (context) {
              return const SigninScreen();
            },
            settings: routeSettings);

      case Routes.appHome:
        return MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
            settings: routeSettings);
      case Routes.appDrawingDetails:
        return MaterialPageRoute(
            builder: (context) {
              return const DrawingDetailsScreen();
            },
            settings: routeSettings);

      case Routes.appDrawingScreen:
        return MaterialPageRoute(
            builder: (context) {
              return const DrawingScreen();
            },
            settings: routeSettings);

      case Routes.appDrawingResult:
        return MaterialPageRoute(
            builder: (context) {
              return const DrawingResultScreen();
            },
            settings: routeSettings);

      case Routes.appDrawingReport:
        return MaterialPageRoute(
            builder: (context) {
              return const DrawingReportScreen();
            },
            settings: routeSettings);

      case Routes.userHistory:
        return MaterialPageRoute(
            builder: (context) {
              return const UserHistoryScreen();
            },
            settings: routeSettings);

      case Routes.userHistoryDetails:
        return MaterialPageRoute(
            builder: (context) {
              return const UserHistoryDetailsScreen();
            },
            settings: routeSettings);

      case Routes.userProfile:
        return MaterialPageRoute(
            builder: (context) {
              return const UserProfileScreen();
            },
            settings: routeSettings);

      case Routes.userChangePassword:
        return MaterialPageRoute(
            builder: (context) {
              return const UserChangePasswordScreen();
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
