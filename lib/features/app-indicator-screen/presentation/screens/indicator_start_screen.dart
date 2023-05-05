import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/buttons/button_widget.dart';
import '../widgets/indicator_screen.dart';

class indicatorStartScreen extends StatefulWidget {
  const indicatorStartScreen({Key? key}) : super(key: key);

  @override
  State<indicatorStartScreen> createState() => _indicatorStartScreenState();
}

class _indicatorStartScreenState extends State<indicatorStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            IndicatorScreen(
              isTop: false,
              imageUrl: "https://d178ormcbshsy5.cloudfront.net/intro_01.png",
              description:
                  "Turn your sketches into realistic portraits with just a few clicks !",
              title: "Start Facetchering",
            ),
            ButtonWidget(
              backgroundColor: AppColors.navigatorItem,
              onPress: () {
                Navigator.pushReplacementNamed(
                    context, Routes.appIndicatorArtistScreen);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Next",
                      style: AppTextStyle.buttonText,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.arrow_forward_sharp,
                      color: AppColors.textPrimary,
                      size: 20,
                    ),
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
