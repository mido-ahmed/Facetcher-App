import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  final Widget leftChild;
  final Widget rightChild;

  const AppBarWidget({Key? key, required this.leftChild, required this.rightChild}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 25, top: 50, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [widget.leftChild, widget.rightChild],
      ),
    );
  }
}
