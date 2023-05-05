import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/buttons/button_widget.dart';
import '../widgets/indicator_screen.dart';

class IndicatorTrailsScreen extends StatefulWidget {
  const IndicatorTrailsScreen({Key? key}) : super(key: key);

  @override
  State<IndicatorTrailsScreen> createState() => _IndicatorTrailsScreenState();
}

class _IndicatorTrailsScreenState extends State<IndicatorTrailsScreen> {
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
              imageUrl: "https://d178ormcbshsy5.cloudfront.net/intro_03.png",
              description:
              "Your trails are saved  and all your data is encrypted.",
              title: "Trails and Data",
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
