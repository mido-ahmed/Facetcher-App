import 'package:facetcher/features/app-get-started/presentation/widgets/intro_widget_wrapper.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/buttons/button_widget.dart';

class IntroDataScreen extends StatefulWidget {
  const IntroDataScreen({Key? key}) : super(key: key);

  @override
  State<IntroDataScreen> createState() => _IntroDataScreenState();
}

class _IntroDataScreenState extends State<IntroDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IntroWidgetWrapper(
              isTop: false,
              imageUrl: ImageNetwork.intro3,
              description: "Your trails are saved  and all your data is encrypted.",
              title: "Trails and Data",
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
                  onPress: () => Navigator.pushNamed(context, Routes.appIntroPermissionsScreen),
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
