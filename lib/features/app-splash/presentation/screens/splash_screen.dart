import 'dart:async';
import 'package:flutter/material.dart';

import 'package:facetcher/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  bool _isUserGetStarted = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _isUserGetStartedCache();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 9000), () => _goNext());
  }

  _goNext() => {
        if (_isUserGetStarted)
          {Navigator.pushReplacementNamed(context, Routes.appSignin)}
        else
          {Navigator.pushReplacementNamed(context, Routes.appGetStarted)}
      };

  Future _isUserGetStartedCache() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _isUserGetStarted = sharedPreferences.getBool(AppStrings.cachedIsUserGetStarted) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSize(
                duration: const Duration(seconds: 3),
                curve: Curves.elasticInOut,
                child: Image.network(ImageNetwork.logoFlat),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
