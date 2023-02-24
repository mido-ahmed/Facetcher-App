import 'package:flutter/material.dart';
import 'package:flutter_starter/core/utils/app_text_style.dart';
import 'package:flutter_starter/core/widgets/buttons/button_widget.dart';
import 'package:flutter_starter/core/widgets/list_title_widget.dart';
import 'package:flutter_starter/features/drawing-result/presentation/widgets/edit_button.dart';
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
                        color: AppColors.navigatorFont),
                  ],
                ),
                ListTitleWidget(
                  title: "The Required",
                  subtitle:
                      "It’s the required person according your gender choice and your drawing. If it’s not the person you need please let us know.",
                ),
                SizedBox(
                  height: 50,
                ),
                OutputImage(
                  image: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                  height: MediaQuery.of(context).size.height / 1.8,
                  width: MediaQuery.of(context).size.width / 0.1,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    EditButton(
                        backgroundColor: AppColors.primary,
                        onPress: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Edit",
                              style: AppTextStyle.editButtonText,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset('assets/icons/Vector.png'),
                          ],
                        )),
                    ButtonWidget(
                      backgroundColor: AppColors.navigatorItem,
                      onPress: () {
                        Navigator.of(context).pushNamed('/user-drawing-report');
                      },
                      icon: Icon(Icons.arrow_forward_sharp),
                      text: "Next",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Next",
                            style: AppTextStyle.primaryButtonText,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Image.asset('assets/icons/shape.png'),
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
