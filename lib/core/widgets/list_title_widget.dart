import 'package:flutter/material.dart';

import '../utils/app_text_style.dart';

class ListTitleWidget extends StatefulWidget {
  final String title;
  final String subtitle;

  const ListTitleWidget({Key? key, required this.title, required this.subtitle}) : super(key: key);

  @override
  State<ListTitleWidget> createState() => _ListTitleWidgetState();
}

class _ListTitleWidgetState extends State<ListTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: AppTextStyle.drawingScreenTitle,
      ),
      subtitle: Text(
        widget.subtitle,
        maxLines: 3,
        style: AppTextStyle.drawingScreenTitleDetails,
      ),
    );
  }
}
