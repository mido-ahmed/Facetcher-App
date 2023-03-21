import 'package:flutter/material.dart';
import 'package:flutter_starter/core/utils/app_colors.dart';
import 'package:flutter_starter/core/utils/app_text_style.dart';
import 'package:flutter_starter/core/utils/assets_manager.dart';
import 'package:flutter_starter/core/utils/media_query_values.dart';

import '../widgets/signin_form_widget.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: context.width,
            height: context.height,
            padding: const EdgeInsets.only(
              top: 60.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 210,
                  child: Hero(
                      tag: 'splash-logo', child: Image.asset(ImgAssets.logo)),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        'What we try to do is to reach the criminal together and get the best result in the shortest time.',
                        style: AppTextStyle.loginDescriptionText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    height: context.height * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(70),
                          topLeft: Radius.circular(70),
                        ),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(48, 48, 48, 1),
                              offset: Offset(0, -2),
                              blurRadius: 8,
                              blurStyle: BlurStyle.normal,
                              spreadRadius: 2),
                        ],
                        color: AppColors.background),
                    child: const SigninFormWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
