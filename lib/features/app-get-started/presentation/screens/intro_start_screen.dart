import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/buttons/button_widget.dart';
import '../widgets/intro_widget_wrapper.dart';

class IntroStartScreen extends StatefulWidget {
  const IntroStartScreen({Key? key}) : super(key: key);

  @override
  State<IntroStartScreen> createState() => _IntroStartScreenState();
}

class _IntroStartScreenState extends State<IntroStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IntroWidgetWrapper(
              isTop: false,
              imageUrl: ImageNetwork.intro1,
              description: "Turn your sketches into realistic portraits with just a few clicks !",
              title: "Start Facetchering",
            ),
            ButtonWidget(
              backgroundColor: AppColors.navigatorItem,
              onPress: () => Navigator.pushNamed(context, Routes.appIntroDrawScreen),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Next", style: AppTextStyle.buttonText,),
                    const SizedBox(width: 4,),
                    Icon(Icons.arrow_forward_sharp, color: AppColors.textPrimary, size: 20,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
