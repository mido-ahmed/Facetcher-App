import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_style.dart';

class ProfileWidget extends StatefulWidget {
  final String? userProfileName;
  final String atUserProfileName;
  final String userProfileIcon;

  const ProfileWidget(
      {Key? key,
      required this.userProfileName,
      required this.atUserProfileName,
      required this.userProfileIcon})
      : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.button,
          radius: 50,
          child: Image.asset(
            widget.userProfileIcon,
            fit: BoxFit.contain,
            scale: 0.6,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.userProfileName,
                    style: AppTextStyle.userProfileTitle,
                  ),
                  TextSpan(
                    text: '\n${widget.atUserProfileName}',
                    style: AppTextStyle.userProfileDetails,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
