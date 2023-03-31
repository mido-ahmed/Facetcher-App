import 'package:flutter/material.dart';
import 'package:facetcher/core/widgets/icons/animated_icon_button.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/navigator/navigation_bar_wrapper.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
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
            body: Column(
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
              ],
            )),
      ),
    );
  }
}
