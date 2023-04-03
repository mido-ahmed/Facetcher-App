import 'package:flutter/material.dart';
import 'package:facetcher/core/utils/app_colors.dart';
import 'package:facetcher/core/utils/app_text_style.dart';
import 'package:facetcher/core/utils/assets_manager.dart';
import 'package:facetcher/core/utils/media_query_values.dart';

import '../widgets/signin_form_widget.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = false;
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isExpanded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: context.width,
            height: context.height,
            padding: const EdgeInsets.only(
              top: 50.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(ImageNetwork.logo, width: 155,),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        'We strive to work together to achieve the best results in fastest ways, bringing swift optimal ones.',
                        style: AppTextStyle.loginDescriptionText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  height: _isExpanded
                      ? context.height * 0.46
                      : context.height * 0.35,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
