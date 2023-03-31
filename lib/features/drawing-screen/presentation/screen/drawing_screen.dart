import 'package:flutter/material.dart';
import 'package:facetcher/core/widgets/navigator/navigation_bar_wrapper.dart';
import 'package:facetcher/features/drawing-screen/presentation/widget/drawer_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/app_bar_widget.dart';

class DrawingScreen extends StatefulWidget {
  const DrawingScreen({Key? key}) : super(key: key);

  @override
  State<DrawingScreen> createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
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
          extendBody: true,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                AppBarWidget(
                  leftChild: IconButton(
                    icon: Icon(Icons.arrow_back, color: AppColors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  rightChild: IconButton(
                      onPressed: () => _handleToggleNavigationBar(),
                      icon: const Icon(
                        Icons.menu,
                        size: 30,
                      ),
                      color: AppColors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Start drawing",
                    style: AppTextStyle.drawingScreenTitle,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: DrawerWidget(),
                ),
                // TODO : update with the last button widget
                // ButtonWidget(text: "Next", icon: Icons.arrow_forward),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
