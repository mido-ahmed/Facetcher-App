import 'package:flutter/material.dart';
import 'package:facetcher/core/utils/app_colors.dart';
import 'package:facetcher/core/validation/validation_types.dart';
import 'package:facetcher/core/widgets/app_bar_widget.dart';
import 'package:facetcher/core/widgets/forms/text_field_widget.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/buttons/button_form_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Material(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppBarWidget(
                  leftChild: Icon(Icons.arrow_back_rounded, color: AppColors.white),
                  rightChild: const SizedBox(),
                ),
                Expanded(
                  child: Container(
                    width: screenWidth,
                    height: screenHeight,
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Expanded(
                        //   flex: 1,
                        //   child: Column(
                        //     children: [
                        //        ProfileWidget(
                        //         userProfileName: 'UserName',
                        //         userEmail: '@username',
                        //         userProfileUrl: Image.asset('assets/images/1.5x/shape.png',)
                        //       ),
                        //       Expanded(
                        //         child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Padding(
                        //               padding: const EdgeInsets.only(
                        //                   top: 30, bottom: 20),
                        //               child: RichText(
                        //                 text: TextSpan(
                        //                   children: [
                        //                     TextSpan(
                        //                       text: 'Change Password',
                        //                       style: AppTextStyle.profileTitles,
                        //                     ),
                        //                     TextSpan(
                        //                       text:
                        //                           '\nChanging your password is on all your responsibility and forgetting password may cause you legal issues.',
                        //                       style:
                        //                           AppTextStyle.profileSubTitles,
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //             Expanded(
                        //               flex: 2,
                        //               child: Padding(
                        //                 padding:
                        //                     const EdgeInsets.only(bottom: 10),
                        //                 child: TextFieldWidget(
                        //                   hintText:
                        //                       'Please, Enter your current password',
                        //                   hintTextStyle:
                        //                       AppTextStyle.textDescribtion,
                        //                   errorStyle:
                        //                       AppTextStyle.textDescribtion,
                        //                   errorBorderColor: AppColors.error,
                        //                   borderWidth: 1,
                        //                   borderColor: AppColors.grey,
                        //                   secureText: true,
                        //                   validateType:
                        //                       ValidationTypes.signinEmail,
                        //                   keyboardType: TextInputType.text,
                        //                   onSave: (_) {},
                        //                   textAlign: TextAlign.start,
                        //                   contentPadding: const EdgeInsets.only(
                        //                       left: 30,
                        //                       top: 15,
                        //                       right: 30,
                        //                       bottom: 15),
                        //                   style: AppTextStyle.textDescribtion,
                        //                   cursorColor: AppColors.grey,
                        //                   maxLines: 1,
                        //                   enabled: true,
                        //                 ),
                        //               ),
                        //             ),
                        //             Padding(
                        //               padding: const EdgeInsets.only(
                        //                 bottom: 10,
                        //                 right: 100,
                        //               ),
                        //               child: RichText(
                        //                 text: TextSpan(
                        //                   children: [
                        //                     TextSpan(
                        //                       text: 'New Password',
                        //                       style: AppTextStyle.profileTitles,
                        //                     ),
                        //                     TextSpan(
                        //                       text: '\nPassword requirements:'
                        //                           '\n• English uppercase characters (A — Z)'
                        //                           '\n• English lowercase characters (a — z)'
                        //                           '\n• Base 10 digits (0 — 9)'
                        //                           '\n• Non-alphanumeric (For example: !, \$, #, or %),',
                        //                       style:
                        //                           AppTextStyle.profileSubTitles,
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //
                        //             Expanded(
                        //               flex: 2,
                        //               child: Padding(
                        //                 padding: const EdgeInsets.only(top: 10),
                        //                 child: TextFieldWidget(
                        //                   enabled: true,
                        //                   hintText:
                        //                       'Please, Enter your new password',
                        //                   hintTextStyle:
                        //                       AppTextStyle.textDescribtion,
                        //                   errorStyle:
                        //                       AppTextStyle.textDescribtion,
                        //                   errorBorderColor: AppColors.error,
                        //                   borderWidth: 1,
                        //                   borderColor: AppColors.grey,
                        //                   secureText: true,
                        //                   validateType:
                        //                       ValidationTypes.signinEmail,
                        //                   keyboardType: TextInputType.text,
                        //                   onSave: (_) {},
                        //                   textAlign: TextAlign.start,
                        //                   contentPadding: const EdgeInsets.only(
                        //                       left: 30,
                        //                       top: 15,
                        //                       right: 30,
                        //                       bottom: 15),
                        //                   style: AppTextStyle.textDescribtion,
                        //                   cursorColor: AppColors.grey,
                        //                   maxLines: 1,
                        //                 ),
                        //               ),
                        //             ),
                        //             // SizedBox(
                        //             //   height: 10,
                        //             // ),
                        //             Expanded(
                        //               flex: 2,
                        //               child: Padding(
                        //                 padding: const EdgeInsets.only(top: 10),
                        //                 child: TextFieldWidget(
                        //                   enabled: true,
                        //                   hintText:
                        //                       'Please, Enter your new password again',
                        //                   hintTextStyle:
                        //                       AppTextStyle.textDescribtion,
                        //                   errorStyle:
                        //                       AppTextStyle.textDescribtion,
                        //                   errorBorderColor: AppColors.error,
                        //                   borderWidth: 1,
                        //                   borderColor: AppColors.grey,
                        //                   secureText: true,
                        //                   validateType:
                        //                       ValidationTypes.signinEmail,
                        //                   keyboardType: TextInputType.text,
                        //                   onSave: (_) {},
                        //                   textAlign: TextAlign.start,
                        //                   contentPadding: const EdgeInsets.only(
                        //                       left: 30,
                        //                       top: 15,
                        //                       right: 30,
                        //                       bottom: 15),
                        //                   style: AppTextStyle.textDescribtion,
                        //                   cursorColor: AppColors.grey,
                        //                   maxLines: 1,
                        //                 ),
                        //               ),
                        //             ),
                        //             Expanded(
                        //               flex: 3,
                        //               child: Padding(
                        //                 padding: const EdgeInsets.only(top: 10),
                        //                 child: ButtonFormWidget(
                        //                   onPress: () {},
                        //                   child: const Text('Submit'),
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
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
