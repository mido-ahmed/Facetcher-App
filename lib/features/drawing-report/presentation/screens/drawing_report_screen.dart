import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';

class DrawingReport extends StatefulWidget {
  const DrawingReport({Key? key}) : super(key: key);

  @override
  State<DrawingReport> createState() => _DrawingReportState();
}

class _DrawingReportState extends State<DrawingReport> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Submit",
                    style: AppTextStyle.drawingScreenTitle,
                  ),
                  subtitle: Text(
                    "Please, Make sure from all your data that you entered as in this step all the data are going to be submitted and all case details will be saved in your history.",
                    maxLines: 3,
                    style: AppTextStyle.drawingScreenTitleDetails,
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
