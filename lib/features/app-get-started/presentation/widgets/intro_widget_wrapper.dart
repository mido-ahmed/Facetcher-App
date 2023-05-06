import 'package:facetcher/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class IntroWidgetWrapper extends StatefulWidget {
  bool? isTop;
  String? imageUrl;
  String? title;
  String? description;

  IntroWidgetWrapper({
    super.key,
    required this.isTop,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  State<IntroWidgetWrapper> createState() => _IntroWidgetWrapperState();
}

class _IntroWidgetWrapperState extends State<IntroWidgetWrapper> {
  Widget screenFormation(var isTop) {
    if (isTop == true) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${widget.title}",
            textAlign: TextAlign.center,
            style: AppTextStyle.indicatorScreenText,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
            child: Text("${widget.description}",
              textAlign: TextAlign.center,
              style: AppTextStyle.indicatorScreenDescription,
            ),
          ),
          Image.network("${widget.imageUrl}"),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network("${widget.imageUrl}"),
          Text("${widget.title}",
            textAlign: TextAlign.center,
            style: AppTextStyle.indicatorScreenText,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
            child: Text("${widget.description}",
              textAlign: TextAlign.center,
              style: AppTextStyle.indicatorScreenDescription,
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: screenFormation(widget.isTop)));
  }
}
