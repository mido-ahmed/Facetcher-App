import 'package:facetcher/core/utils/assets_manager.dart';
import 'package:facetcher/data/models/user-trial/user_trial.dart';
import 'package:flutter/material.dart';
import 'package:facetcher/core/utils/app_text_style.dart';
import 'package:facetcher/core/widgets/buttons/button_widget.dart';
import 'package:facetcher/core/widgets/list_title_widget.dart';
import 'package:facetcher/features/drawing-result/presentation/widgets/edit_button.dart';
import 'package:facetcher/features/drawing-result/presentation/widgets/output_Image.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';

class DrawingResult extends StatefulWidget {
  const DrawingResult({Key? key}) : super(key: key);

  @override
  State<DrawingResult> createState() => _DrawingResultState();
}

class _DrawingResultState extends State<DrawingResult> {
  @override
  Widget build(BuildContext context) {
    UserTrial userTrial = ModalRoute.of(context)?.settings.arguments as UserTrial;
    return Material(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 35.0, right: 35.0, top: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ListTitleWidget(
                  titleAlign: TextAlign.center,
                  title: "Drawing Result",
                  subtitleAlign: TextAlign.center,
                  subtitle: "It’s the required person according your gender choice and your drawing. If it’s not the person you need please let us know.",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: OutputImage(
                    image: userTrial.outputImage.imageUrl,
                    height: MediaQuery.of(context).size.height / 1.8,
                    width: MediaQuery.of(context).size.width / 0.1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EditButton(
                      backgroundColor: AppColors.primary,
                      onPress: () => Navigator.pop(context),
                        child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Edit",
                              style: AppTextStyle.editButtonText,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Image.network(ImageNetwork.editIcon),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    ButtonWidget(
                      backgroundColor: AppColors.navigatorItem,
                      onPress: () => Navigator.pushNamed(context, Routes.appDrawingReport, arguments: userTrial,),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Next",
                              style: AppTextStyle.buttonText,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.arrow_forward_sharp,
                              color: AppColors.textPrimary,
                              size: 17,
                            ),
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
    );
  }
}
