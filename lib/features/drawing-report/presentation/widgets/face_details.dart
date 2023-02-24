import 'package:flutter/material.dart';
import 'package:flutter_starter/core/utils/app_text_style.dart';
import 'package:flutter_starter/core/widgets/list_title_widget.dart';

class FaceDetails extends StatefulWidget {
  const FaceDetails({Key? key}) : super(key: key);

  @override
  _FaceDetailsState createState() => _FaceDetailsState();
}

class _FaceDetailsState extends State<FaceDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Details",
                style: AppTextStyle.textDrawingReport,
              ),
              Image.asset('assets/icons/Vector.png'),
            ],
          ),
          SizedBox(
            height: 30,
          ),
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
          SizedBox(
            height: 30,
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
          SizedBox(
            height: 30,
          ),
          Text(
            "Description :Lorem ipsum dolor  sit amet consectetur. Eleifend fringillaodio iaculis tortor faucibus netus nisl pulvinar mollis. Mattis nisl aliquam  nunc aliquam proin odio. Consequat amet tortor facilisis quam sit. Adipiscing interdum pellentesque elementum ut... ",
            //maxLines: 5,
            style: AppTextStyle.textDescribtion,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
