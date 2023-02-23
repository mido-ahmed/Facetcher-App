import 'package:flutter/material.dart';
import 'package:flutter_starter/core/utils/app_colors.dart';

class OutputImage extends StatefulWidget {
  const OutputImage({Key? key}) : super(key: key);

  @override
  State<OutputImage> createState() => _OutputImageState();
}

class _OutputImageState extends State<OutputImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 0.1,
        height: MediaQuery.of(context).size.height / 1.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(width: 1, color: AppColors.text),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.network(
              // color: AppColors.text,
              'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
