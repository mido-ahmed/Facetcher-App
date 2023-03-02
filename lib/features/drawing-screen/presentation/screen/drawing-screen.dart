import 'package:flutter/material.dart';
import 'package:flutter_starter/core/utils/app_colors.dart';
import 'package:flutter_starter/core/widgets/buttons/button_widget.dart';
import 'package:flutter_starter/features/drawing-screen/presentation/widget/app-bar.dart';
import 'package:flutter_starter/features/drawing-screen/presentation/widget/drawing-part.dart';

import '../../../../core/widgets/list_title_widget.dart';

class DrawingScreen extends StatefulWidget {
  const DrawingScreen({Key? key}) : super(key: key);

  @override
  State<DrawingScreen> createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  AppBarWidget(),
                  ListTitleWidget(
                    title: "Start drawing",
                    subtitle:
                        "Every single step in this drawing is recorded. Don’t use it for a personal purposes.",
                  ),
                  SizedBox(height: 20),
                  Drawing(),
                  SizedBox(
                    height: 10,
                  ),
                  ButtonWidget(text: "Next", Icon: Icons.arrow_forward),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
