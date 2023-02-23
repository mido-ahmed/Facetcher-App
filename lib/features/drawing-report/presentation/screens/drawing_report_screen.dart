import 'package:flutter/material.dart';
import 'package:flutter_starter/features/drawing-report/presentation/widgets/face_details.dart';

import '../../../../core/utils/app_colors.dart';
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          size: 30,
                        ),
                        color: AppColors.navigatorFont),
                  ],
                ),
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
                SizedBox(
                  height: 51,
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
                FaceDetails(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your drawing and output",
                      style: AppTextStyle.textDrawingReport,
                    ),
                    Image.asset('assets/icons/Vector.png'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
