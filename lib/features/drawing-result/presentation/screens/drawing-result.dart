import 'package:flutter/material.dart';
import 'package:flutter_starter/core/utils/app_text_style.dart';
import 'package:flutter_starter/core/widgets/buttons/button_widget.dart';
import 'package:flutter_starter/features/drawing-result/presentation/widgets/output_Image.dart';

import '../../../../core/utils/app_colors.dart';

class DrawingResult extends StatefulWidget {
  const DrawingResult({Key? key}) : super(key: key);

  @override
  State<DrawingResult> createState() => _DrawingResultState();
}

class _DrawingResultState extends State<DrawingResult> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          size: 30,
                        ),
                        color: AppColors.white),
                  ],
                ),
                ListTile(
                  title: Text(
                    "The Required",
                    style: AppTextStyle.drawingScreenTitle,
                  ),
                  subtitle: Text(
                    "It’s the required person according your gender choice and your drawing. If it’s not the person you need please let us know.",
                    maxLines: 2,
                    style: AppTextStyle.drawingScreenTitleDetails,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                OutputImage(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWidget(
                      backgroundColor: AppColors.primary,
                      onPress: () {},
                      child: Row(
                        children: [
                          Text("Edit"),
                          Icon(Icons.edit_attributes_outlined),
                        ],
                      ),
                    ),
                    ButtonWidget(
                      backgroundColor: AppColors.navigatorItem,
                      onPress: () {},
                      child: Row(
                        children: [
                          Text("Next"),
                          Icon(Icons.arrow_forward_sharp),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
