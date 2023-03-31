import 'package:flutter/material.dart';
import 'package:facetcher/features/drawing-report/presentation/widgets/face_details.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/list_title_widget.dart';
import '../../../drawing-result/presentation/widgets/output_Image.dart';

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
                ListTitleWidget(
                  title: "Submit",
                  subtitle:
                      "Please, Make sure from all your data that you entered as in this step all the data are going to be submitted and all case details will be saved in your history.",
                ),
                FaceDetails(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
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
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutputImage(
                            image:
                                "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                            width: 149.2,
                            height: 185.85,
                          ),
                          OutputImage(
                            image:
                                "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                            width: 149.2,
                            height: 185.85,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
