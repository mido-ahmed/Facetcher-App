import 'package:flutter/material.dart';
import 'package:facetcher/core/utils/app_colors.dart';

class ButtonWidget extends StatefulWidget {
  final String text;
  final Icon icon;
  final Color backgroundColor;
  final VoidCallback onPress;
  final Widget child;

  const ButtonWidget({
    Key? key,
    required this.backgroundColor,
    required this.onPress,
    required this.text,
    required this.icon,
    required this.child,
  }) : super(key: key);

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
      child: SizedBox(
        width: 140,
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(widget.backgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
          onPressed: widget.onPress,
          child: widget.child,
        ),
      ),
    );
  }
}
