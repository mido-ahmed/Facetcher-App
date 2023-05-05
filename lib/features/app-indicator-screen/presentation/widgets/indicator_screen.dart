import 'package:facetcher/core/utils/app_colors.dart';
import 'package:facetcher/core/utils/app_text_style.dart';
import 'package:facetcher/core/widgets/buttons/button_widget.dart';
import 'package:flutter/material.dart';

class IndicatorScreen extends StatefulWidget {
  bool? isTop;
  String? imageUrl;
  String? title;
  String? description;

  IndicatorScreen({
    super.key,
    required this.isTop,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  State<IndicatorScreen> createState() => _IndicatorScreenState();
}

class _IndicatorScreenState extends State<IndicatorScreen> {
  Widget screenFormation(var isTop) {
    if (isTop == true) {
      return Column(
        children: [
          Text(
            "${widget.title}",
            style: AppTextStyle.indicatorScreenText,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 49),
            child: Text(
              "${widget.description}",
              style: AppTextStyle.indicatorScreenDescription,
            ),
          ),
          Image.network("${widget.imageUrl}"),
        ],
      );
    } else {
      return Column(
        children: [
          Image.network("${widget.imageUrl}"),
          Text(
            "${widget.title}",
            style: AppTextStyle.indicatorScreenText,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 49),
            child: Text(
              "${widget.description}",
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
            padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 30),
            child: screenFormation(widget.isTop)));
  }
}
