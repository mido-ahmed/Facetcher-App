import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';
import '../widgets/drawing_details_forms_widget.dart';

class DrawingDetailsScreen extends StatefulWidget {
  const DrawingDetailsScreen({Key? key}) : super(key: key);

  @override
  State<DrawingDetailsScreen> createState() => DrawingDetailsState();
}

class DrawingDetailsState extends State<DrawingDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35.0, right: 35.0, top: 90.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Drawing Details",
                      style: AppTextStyle.drawingScreenTitle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
                      child: Text("Enter all the details and description for the drawing, as all what you do here is recorded",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.drawingScreenTitleDetails,
                      ),
                    ),
                    const DrawingDetailsForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
