import 'package:flutter/material.dart';
import 'package:flutter_starter/core/utils/app_colors.dart';
import 'package:flutter_starter/core/utils/app_text_style.dart';

class CircularButton extends StatefulWidget {
  const CircularButton(
      {Key? key,
      required this.image,
      required this.function,
      required this.circleRadius})
      : super(key: key);

  final String image;
  final VoidCallback function;
  final double? circleRadius;

  @override
  State<CircularButton> createState() => _CircularButtonState();
}

class _CircularButtonState extends State<CircularButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: widget.function,
          child: CircleAvatar(
            child: Image.asset(widget.image),
            radius: widget.circleRadius,
            backgroundColor: AppColors.navigatorItem,
          ),
        ),
      ],
    );
  }
}
