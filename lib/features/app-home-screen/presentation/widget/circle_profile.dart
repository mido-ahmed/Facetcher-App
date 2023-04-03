import 'package:flutter/material.dart';
import 'package:facetcher/core/utils/app_colors.dart';

class CircularButton extends StatefulWidget {
  const CircularButton(
      {Key? key,
      required this.child,
      required this.function,
      required this.circleRadius})
      : super(key: key);

  final Widget child;
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
        GestureDetector(
          onTap: widget.function,
          child: CircleAvatar(
            radius: widget.circleRadius,
            backgroundColor: AppColors.navigatorItem,
            child: widget.child,
          ),
        ),
      ],
    );
  }
}
