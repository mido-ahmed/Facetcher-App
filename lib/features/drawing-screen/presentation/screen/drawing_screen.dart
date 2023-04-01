import 'package:flutter/material.dart';
import 'package:facetcher/features/drawing-screen/presentation/widget/drawer_widget.dart';

import '../../../../core/utils/app_text_style.dart';

class DrawingScreen extends StatefulWidget {
  const DrawingScreen({Key? key}) : super(key: key);

  @override
  State<DrawingScreen> createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  int submissionId = 0;

  @override
  Widget build(BuildContext context) {
    // TODO : uncomment submission id
    // submissionId = ModalRoute.of(context)?.settings.arguments as int?;
    return Material(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text("Start drawing",
                      style: AppTextStyle.drawingScreenTitle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: DrawerWidget(submissionId: submissionId),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
