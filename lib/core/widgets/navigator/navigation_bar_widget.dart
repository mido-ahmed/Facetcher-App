import 'package:flutter/material.dart';

import '../../../config/routes/app_routes.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_style.dart';
import 'navigation_bar_salomon.dart';

class NavigationBarWidget extends StatefulWidget {
  final String? path;

  const NavigationBarWidget({Key? key, this.path}) : super(key: key);

  @override
  NavigationBarWidgetState createState() => NavigationBarWidgetState();
}

class NavigationBarWidgetState extends State<NavigationBarWidget> {
  List<String> routes = [Routes.appHome, Routes.userHistory, Routes.userProfile];
  late int _selectedItemPosition = routes.indexOf(widget.path!);

  @override
  Widget build(BuildContext context) {
    return SalomonBar(
      currentIndex: _selectedItemPosition,
      onTap: (index) => {
        setState(() => _selectedItemPosition = index),
        if (widget.path != routes.elementAt(index))
          Navigator.pushReplacementNamed(context, routes.elementAt(index)),
      },
      items: [
        SalomonBarItem(
          icon: Icon(Icons.home_outlined, color: AppColors.navigatorFont,),
          title: Text("Home", style: AppTextStyle.navigatorItem,),
          selectedColor: AppColors.navigatorItem,
        ),
        SalomonBarItem(
          icon: Icon(Icons.history, color: AppColors.navigatorFont,),
          title: Text("History", style: AppTextStyle.navigatorItem,),
          selectedColor: AppColors.navigatorItem,
        ),
        SalomonBarItem(
          icon: Icon(Icons.person_outline_outlined, color: AppColors.navigatorFont,),
          title: Text("Profile", style: AppTextStyle.navigatorItem,),
          selectedColor: AppColors.navigatorItem,
        ),
      ],
    );
  }
}
