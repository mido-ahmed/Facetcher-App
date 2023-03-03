import 'package:flutter/material.dart';
import 'package:flutter_starter/core/utils/app_colors.dart';

class OutputImage extends StatefulWidget {
  final double width;
  final double height;
  final String image;

  const OutputImage(
      {Key? key,
      required this.width,
      required this.height,
      required this.image})
      : super(key: key);

  @override
  State<OutputImage> createState() => _OutputImageState();
}

class _OutputImageState extends State<OutputImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(width: 1, color: AppColors.textPrimary),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.network(
              widget.image,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
