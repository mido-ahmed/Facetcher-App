import 'package:facetcher/core/utils/assets_manager.dart';
import 'package:facetcher/data/models/user-trial/user_trial.dart';
import 'package:flutter/material.dart';
import 'package:facetcher/core/utils/app_text_style.dart';
import 'package:facetcher/core/widgets/buttons/button_widget.dart';
import 'package:facetcher/features/drawing-result/presentation/widgets/edit_button.dart';
import 'package:facetcher/features/drawing-result/presentation/widgets/output_Image.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/icons/animated_icon_button.dart';
import '../../../../core/widgets/navigator/navigation_bar_wrapper.dart';

class DrawingResult extends StatefulWidget {
  const DrawingResult({Key? key}) : super(key: key);

  @override
  State<DrawingResult> createState() => _DrawingResultState();
}

class _DrawingResultState extends State<DrawingResult> {
  bool _toggleNavigationBar = false;

  void _handleToggleNavigationBar() {
    setState(() {
      _toggleNavigationBar = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserTrial userTrial = ModalRoute.of(context)?.settings.arguments as UserTrial;
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
                  Text("Drawing Result", style: AppTextStyle.drawingScreenTitle,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                    child: OutputImage(
                      image: userTrial.outputImage.imageUrl,
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width / 0.1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EditButton(
                        backgroundColor: AppColors.primary,
                        onPress: () => Navigator.pop(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Edit", style: AppTextStyle.editButtonText,),
                            const SizedBox(width: 6,),
                            Image.network(ImageNetwork.editIcon),
                          ],
                        ),
                      ),
                      const SizedBox(width: 30.0,),
                      ButtonWidget(
                        backgroundColor: AppColors.navigatorItem,
                        onPress: () => Navigator.pushNamed(
                          context,
                          Routes.appDrawingReport,
                          arguments: userTrial,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Next", style: AppTextStyle.buttonText,),
                              const SizedBox(width: 4,),
                              Icon(Icons.arrow_forward_sharp, color: AppColors.textPrimary, size: 17,),
                            ],
                          ),
                        ),
                      ),
                    ],
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
