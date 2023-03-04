import 'package:flutter/material.dart';
import 'package:flutter_starter/core/utils/app_colors.dart';
import 'package:flutter_starter/core/utils/app_text_style.dart';

class CircularProfile extends StatefulWidget {
  const CircularProfile({Key? key}) : super(key: key);

  @override
  State<CircularProfile> createState() => _CircularProfileState();
}

class _CircularProfileState extends State<CircularProfile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: CircleAvatar(
            child: Image.asset('assets/images/1.5x/shape.png'),
            radius: 25,
            backgroundColor: AppColors.navigatorItem,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hey,User",
                style: AppTextStyle.appBarUserProfile,
              ),
              Text(
                "Let’s sketch today",
                style: AppTextStyle.drawingScreenTitleDetails,
              ),
            ],
          ),
        )
      ],
    );
  }
}
