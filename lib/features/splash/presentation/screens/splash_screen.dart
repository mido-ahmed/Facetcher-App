import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../config/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 8000), () => _goNext());
  }

  _goNext() => {Navigator.pushReplacementNamed(context, Routes.login)};

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSize(
                duration: const Duration(seconds: 2),
                curve: Curves.elasticInOut,
                child: Image.asset('assets/images/2x/Group.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
