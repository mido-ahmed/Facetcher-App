import 'package:facetcher/core/utils/media_query_values.dart';
import 'package:facetcher/core/widgets/navigator/navigation_bar_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:facetcher/features/drawing-screen/presentation/widget/drawer_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/icons/animated_icon_button.dart';

class DrawingScreen extends StatefulWidget {
  const DrawingScreen({Key? key}) : super(key: key);

  @override
  State<DrawingScreen> createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  bool _toggleNavigationBar = false;
  int? submissionId = 0;

  void _handleToggleNavigationBar() {
    setState(() {
      _toggleNavigationBar = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    //submissionId = ModalRoute.of(context)?.settings.arguments as int?;
    return NavigationBarWrapper(
      toggleNavigationBar: _toggleNavigationBar,
      path: ModalRoute.of(context)?.settings.name,
      child: Material(
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
                children: [
                  AppBarWidget(
                    leftChild: IconButton(
                      icon: Icon(Icons.arrow_back, color: AppColors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    rightChild: AnimatedIconButton(
                      icon: AnimatedIcons.menu_close,
                      color: AppColors.fontPrimary,
                      onPressed: () => _handleToggleNavigationBar(),
                      durationMilliseconds: 500,
                      size: 32.0,
                      end: 1.0,
                    ),
                  ),
                  Text("Start Drawing",
                    style: AppTextStyle.drawingScreenTitle,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: context.height * 0.04),
                    child: DrawerWidget(submissionId: submissionId!),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
