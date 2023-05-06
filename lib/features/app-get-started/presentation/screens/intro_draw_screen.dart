import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/buttons/button_widget.dart';
import '../widgets/intro_widget_wrapper.dart';

class IntroDrawScreen extends StatefulWidget {
  const IntroDrawScreen({Key? key}) : super(key: key);

  @override
  State<IntroDrawScreen> createState() => _IntroDrawScreenState();
}

class _IntroDrawScreenState extends State<IntroDrawScreen> {
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
              isTop: true,
              imageUrl: "https://d178ormcbshsy5.cloudfront.net/intro_02.png",
              description: "To be an artistic to use our app. You only need little drawing skills.",
              title: "NO NEED !",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  backgroundColor: AppColors.navigatorItem,
                  onPress: () => Navigator.pop(context),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back_outlined, color: AppColors.textPrimary, size: 20,),
                        const SizedBox(width: 4,),
                        Text("Back", style: AppTextStyle.buttonText,),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 40.0,),
                ButtonWidget(
                  backgroundColor: AppColors.navigatorItem,
                  onPress: () => Navigator.pushNamed(context, Routes.appIntroDataScreen),
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
          ],
        ),
      ),
    );
  }
}
