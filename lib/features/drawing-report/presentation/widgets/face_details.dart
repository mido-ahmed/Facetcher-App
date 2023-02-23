import 'package:flutter/material.dart';
import 'package:flutter_starter/core/utils/app_text_style.dart';

class FaceDetails extends StatefulWidget {
  const FaceDetails({Key? key}) : super(key: key);

  @override
  _FaceDetailsState createState() => _FaceDetailsState();
}

class _FaceDetailsState extends State<FaceDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "Title :",
              style: AppTextStyle.editButtonText,
            ),
            Text(
              "title",
              style: AppTextStyle.textDescribtion,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Gender :",
              style: AppTextStyle.editButtonText,
            ),
            Text(
              "Male",
              style: AppTextStyle.textDescribtion,
            ),
          ],
        ),
        ListTile(
          title:Text(
            "Description :",
            style: AppTextStyle.editButtonText,
          ),
          subtitle:   Text(
            "Description: Lorem ipsum dolor sit amet consectetur. Eleifend fringilla odio iaculis tortor faucibus netus nisl pulvinar mollis. Mattis nisl aliquam nunc aliquam proin odio. Consequat amet tortor facilisis quam sit. Adipiscing interdum pellentesque elementum ut... ",
            style: AppTextStyle.textDescribtion,
          ),
        ),
      ],
    );
  }
}
