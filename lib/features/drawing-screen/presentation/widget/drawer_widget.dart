import 'package:flutter/material.dart';
import 'package:flutter_starter/core/utils/app_colors.dart';
import 'package:flutter_starter/core/utils/media_query_values.dart';
import 'package:scribble/scribble.dart';

import '../../../../core/widgets/drawer/scribble_drawer.dart';
import 'drawer_toolbar.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late ScribbleNotifier notifier;

  @override
  void initState() {
    notifier = ScribbleNotifier();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.65,
      width: context.width * 0.90,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(
          width: 1,
          color: AppColors.border,
          style: BorderStyle.solid,
        ),
      ),
      child: Stack(
        children: [
          ScribbleDrawer(
            notifier: notifier,
            drawEraser: true,
            drawPen: true,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              DrawerToolbar(notifier: notifier, context: context),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _saveImage(BuildContext context) async {
    final image = await notifier.renderImage();
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: const Text("Your Image"),
            content: Image.memory(image.buffer.asUint8List()),
          ),
    );
  }
}