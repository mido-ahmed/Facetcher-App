import 'package:flutter/material.dart';
import 'package:flutter_starter/core/utils/app_text_style.dart';
import 'package:flutter_starter/core/widgets/navigator/navigation_bar_wrapper.dart';
import 'package:flutter_starter/features/home-screen/presentation/widget/History.dart';
import 'package:flutter_starter/features/home-screen/presentation/widget/animated_button.dart';
import 'package:flutter_starter/features/home-screen/presentation/widget/circle_profile.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/icons/animated_icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
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
          extendBody: true,
          resizeToAvoidBottomInset: true,
          body: Column(
            children: [
              AppBarWidget(
                leftChild: Row(
                  children: [
                    CircularButton(
                      image: "assets/images/1.5x/shape.png",
                      function: () {},
                      circleRadius: 25.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hey,User",
                            style: AppTextStyle.appBarUserProfile,
                          ),
                          Text(
                            "Let’s sketch today",
                            style: AppTextStyle.drawingScreenTitleDetails,
                          ),
                        ],
                      ),
                    ),
                  ],
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
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  "From sketch",
                  style: AppTextStyle.homeScreenTextOne,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 55.0, top: 7.0),
                child: Text(
                  "To Life",
                  style: AppTextStyle.homeScreenTextTwo,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23),
                child: Container(
                  child: Text(
                    "What we try to do is to reach the criminal together and get the best result in the shortest time.",
                    style: AppTextStyle.homeScreenDetails,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23, top: 40),
                child: HistoryDraws(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Container(
                            width: 100,
                            height: 168,
                            decoration: BoxDecoration(
                                color: AppColors.textSecondary,
                                border: Border.all(
                                    color: AppColors.historyBorder,
                                    width: 1.0,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          SizedBox(
                            width: 35,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
              AnimatedCircleContainer()
            ],
          ),
        ),
      ),
    );
  }
}
