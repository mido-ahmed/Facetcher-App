import 'package:flutter/material.dart';

import '../../utils/app_text_style.dart';

class UserProfileDetailsWidget extends StatelessWidget {
  final String title;
  final String details;

  const UserProfileDetailsWidget({Key? key, required this.title, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: AppTextStyle.userProfileInfo,
          ),
          TextSpan(
            text:   '\n\n$details',
            style: AppTextStyle.userProfileDetails,
          ),
        ],
      ),
    );
  }
}