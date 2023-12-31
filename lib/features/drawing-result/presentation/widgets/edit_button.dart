import 'package:flutter/material.dart';
import 'package:facetcher/core/utils/app_colors.dart';

class EditButton extends StatefulWidget {
  final Widget child;
  final Color backgroundColor;
  final VoidCallback onPress;

  const EditButton(
      {Key? key,
      required this.backgroundColor,
      required this.onPress,
      required this.child})
      : super(key: key);

  @override
  State<EditButton> createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 141,
      height: 41,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadiusDirectional.circular(26),
      ),
      child: SizedBox(
        width: 140,
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(widget.backgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: const BorderSide(width: 1, color: Colors.white,
                ),
              ),
            ),
          ),
          onPressed: widget.onPress,
          child: widget.child
        ),
      ),
    );
  }
}
