import 'package:flutter/material.dart';
import 'package:flutter_starter/core/utils/app_colors.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({Key? key, required this.text, this.Icon})
      : super(key: key);
  final String text;
  final Icon;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 40,
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            )),
            backgroundColor: MaterialStateProperty.all(AppColors.button),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Next" , style: TextStyle(fontSize: 15), textAlign: TextAlign.center),
              Icon(Icons.arrow_forward_sharp , size: 20),
            ],
          )),
    );
  }
}
