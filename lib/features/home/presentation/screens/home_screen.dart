import 'package:flutter/material.dart';
import 'package:flutter_starter/core/widgets/navigator/navigation_bar_wrapper.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _toggleNavigationBar = false;

  void _handleToggleNavigationBar() {
    setState(() {
      _toggleNavigationBar = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBarWrapper(
      toggleNavigationBar: _toggleNavigationBar,
      path: ModalRoute.of(context)?.settings.name,
      child: Material(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 30.0),
                child: Text(
                  "Hello Developer!",
                  style: AppTextStyle.homeText,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, right: 35.0),
                  child: IconButton(
                      onPressed: () => _handleToggleNavigationBar(),
                      icon: const Icon(
                        Icons.menu,
                        size: 30,
                      ),
                      color: AppColors.white),
                ),
              ],
            ),
            extendBody: true,
            resizeToAvoidBottomInset: true,
            body: Center(
              child: Text(
                "Home",
                style: AppTextStyle.homeText,
              ),
            )),
      ),
    );
  }
}
