import 'package:facetcher/data/models/user-trial/user_trial.dart';
import 'package:flutter/material.dart';
import 'package:facetcher/core/utils/app_text_style.dart';
import 'package:facetcher/core/widgets/buttons/button_widget.dart';
import 'package:facetcher/core/widgets/list_title_widget.dart';
import 'package:facetcher/features/drawing-result/presentation/widgets/edit_button.dart';
import 'package:facetcher/features/drawing-result/presentation/widgets/output_Image.dart';

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
    print(userTrial);
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
                        icon: const Icon(
                          Icons.menu,
                          size: 30,
                        ),
                        color: AppColors.navigatorFont),
                  ],
                ),
                const ListTitleWidget(
                  title: "The Required",
                  subtitle:
                      "It’s the required person according your gender choice and your drawing. If it’s not the person you need please let us know.",
                ),
                const SizedBox(
                  height: 50,
                ),
                OutputImage(
                  image:
                      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                  height: MediaQuery.of(context).size.height / 1.8,
                  width: MediaQuery.of(context).size.width / 0.1,
                ),
                const SizedBox(
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
                            const SizedBox(
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
                      icon: const Icon(Icons.arrow_forward_sharp),
                      text: "Next",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Next",
                            style: AppTextStyle.primaryButtonText,
                          ),
                          const SizedBox(
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
