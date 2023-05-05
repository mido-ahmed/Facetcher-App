import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../widgets/indicator_screen.dart';

class indicatorStartScreen extends StatefulWidget {
  const indicatorStartScreen({Key? key}) : super(key: key);

  @override
  State<indicatorStartScreen> createState() => _indicatorStartScreenState();
}

class _indicatorStartScreenState extends State<indicatorStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        body: IndicatorScreen(
          onpress: () {
            Navigator.pushReplacementNamed(context, Routes.appIndicatorArtistScreen);
          },
          isTop: false,
          imageUrl: "https://d178ormcbshsy5.cloudfront.net/intro_01.png",
          description:
              "Turn your sketches into realistic portraits with just a few clicks !",
          title: "Start Facetchering",
        ),
      ),
    );
  }
}
