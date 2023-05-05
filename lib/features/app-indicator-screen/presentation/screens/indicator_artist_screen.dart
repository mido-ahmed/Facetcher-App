import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/buttons/button_widget.dart';
import '../widgets/indicator_screen.dart';

class IndicatorArtistScreen extends StatefulWidget {
  const IndicatorArtistScreen({Key? key}) : super(key: key);

  @override
  State<IndicatorArtistScreen> createState() => _IndicatorArtistScreenState();
}

class _IndicatorArtistScreenState extends State<IndicatorArtistScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 21),
          child: Column(
            children: [
              IndicatorScreen(
                isTop: true,
                imageUrl: "https://d178ormcbshsy5.cloudfront.net/intro_02.png",
                description:
                    "To be an artistic to use our app. You only need little drawing skills.",
                title: "NO NEED !",
              ),
              ButtonWidget(
                backgroundColor: AppColors.navigatorItem,
                onPress: () {
                  Navigator.pushReplacementNamed(
                      context, Routes.appIndicatorTrailsScreen);
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
      ),
    );
  }
}
