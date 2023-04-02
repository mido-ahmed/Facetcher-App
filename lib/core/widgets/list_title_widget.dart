import 'package:flutter/material.dart';

import '../utils/app_text_style.dart';

class ListTitleWidget extends StatefulWidget {
  final String title;
  final TextAlign titleAlign;
  final String subtitle;
  final TextAlign subtitleAlign;

  const ListTitleWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.titleAlign,
      required this.subtitleAlign})
      : super(key: key);

  @override
  State<ListTitleWidget> createState() => _ListTitleWidgetState();
}

class _ListTitleWidgetState extends State<ListTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        textAlign: widget.titleAlign,
        style: AppTextStyle.drawingScreenTitle,
      ),
      subtitle: Text(
        widget.subtitle,
        maxLines: 3,
        textAlign: widget.subtitleAlign,
        style: AppTextStyle.drawingScreenTitleDetails,
      ),
    );
  }
}
