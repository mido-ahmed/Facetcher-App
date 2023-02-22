import 'package:flutter/material.dart';
import 'package:flutter_starter/core/utils/app_colors.dart';

class ButtonWidget extends StatefulWidget {
  final Widget child;
  final Color backgroundColor;
  final VoidCallback onPress;

  const ButtonWidget(
      {Key? key,
      required this.backgroundColor,
      required this.onPress,
      required this.child})
      : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 141,
      height: 41,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadiusDirectional.circular(26),
      ),
      child: Container(
        width: 140,
        height: 40,
        child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(width: 1, color: Colors.white),
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all(widget.backgroundColor),
            ),
            onPressed: widget.onPress,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.child,
              ],
            )),
      ),
    );
  }
}
