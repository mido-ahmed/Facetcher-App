import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';

class RichTextTitledWidget extends StatelessWidget {
  final String title;
  final String details;

  const RichTextTitledWidget({Key? key, required this.title, required this.details}) : super(key: key);

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
            text: '   $details',
            style: AppTextStyle.userProfileDetails,
          ),
        ],
      ),
    );
  }
}