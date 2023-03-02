import 'package:flutter/material.dart';
import 'package:flutter_starter/core/utils/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'navigation_bar_widget.dart';

class NavigationBarWrapper extends StatefulWidget {
  final bool toggleNavigationBar;
  final String? path;
  final Widget child;

  const NavigationBarWrapper(
      {super.key,
      required this.toggleNavigationBar,
      this.path,
      required this.child});

  @override
  NavigatorState createState() => NavigatorState();
}

class NavigatorState extends State<NavigationBarWrapper> {
  bool _isNavigationBarToggled = false;
  final Duration _duration = const Duration(milliseconds: 500);

  @override
  void didUpdateWidget(covariant NavigationBarWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.toggleNavigationBar) {
      setState(() {
        _isNavigationBarToggled = !_isNavigationBarToggled;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: _duration,
            top: _isNavigationBarToggled ? 100 : 0,
            left: _isNavigationBarToggled ? -100 : 0,
            right: _isNavigationBarToggled ? 80 : 0,
            bottom: _isNavigationBarToggled ? -100 : 0,
            child: Container(
              color: Colors.blue,
              child: widget.child,
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            top: _isNavigationBarToggled
                ? 0
                : -(MediaQuery.of(context).size.height + 80),
            right: _isNavigationBarToggled ? 0 : -80,
            child: Container(
              padding: const EdgeInsets.only(top: 100.0, bottom: 150.0),
              width: 80,
              height: MediaQuery.of(context).size.height,
              color: AppColors.navigatorBackground,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(FontAwesomeIcons.github, color: AppColors.navigatorFont, size: 21,),
                  Icon(FontAwesomeIcons.linkedinIn, color: AppColors.navigatorFont, size: 21,),
                  Icon(Icons.messenger_outline_sharp, color: AppColors.navigatorFont, size: 22,),
                  Icon(Icons.info_outlined, color: AppColors.navigatorFont, size: 22,),
                  Icon(Icons.logout_outlined, color: AppColors.navigatorFont, size: 22,),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: _duration,
            top: _isNavigationBarToggled ? 0 : -120,
            left: _isNavigationBarToggled
                ? 0
                : MediaQuery.of(context).size.width - 120,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              color: AppColors.navigatorBackground,
              child: Center(
                child: NavigationBarWidget(
                  path: widget.path,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
