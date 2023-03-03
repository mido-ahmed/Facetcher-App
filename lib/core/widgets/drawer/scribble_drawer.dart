import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/core/widgets/drawer/scribble_painter.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:scribble/src/scribble.notifier.dart';
import 'package:scribble/src/state/scribble.state.dart';
import 'package:scribble/src/core/pan_gesture_catcher.dart';

class ScribbleDrawer extends StatefulWidget {
  final ScribbleNotifierBase notifier;
  final bool drawPen;
  final bool drawEraser;

  const ScribbleDrawer({
    required this.notifier,
    this.drawPen = true,
    this.drawEraser = true,
    Key? key,
  }) : super(key: key);

  @override
  State<ScribbleDrawer> createState() => _ScribbleDrawerState();
}

class _ScribbleDrawerState extends State<ScribbleDrawer> {
  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder<ScribbleState>(
      stateNotifier: widget.notifier,
      builder: (context, state, _) {
        final drawCurrentTool = widget.drawPen && state is Drawing || widget.drawEraser && state is Erasing;
        final child = SizedBox.expand(
          child: RepaintBoundary(
            key: widget.notifier.repaintBoundaryKey,
            child: CustomPaint(
              painter: ScribblePainter(
                state: state,
                drawPointer: widget.drawPen,
                drawEraser: widget.drawEraser,
              ),
            ),
          ),
        );
        return !state.active
            ? child
            : GestureCatcher(
          pointerKindsToCatch: state.supportedPointerKinds,
          child: MouseRegion(
            cursor: drawCurrentTool && state.supportedPointerKinds.contains(PointerDeviceKind.mouse)
                ? SystemMouseCursors.none
                : MouseCursor.defer,
            onExit: widget.notifier.onPointerExit,
            child: Listener(
              onPointerUp: widget.notifier.onPointerUp,
              onPointerDown: widget.notifier.onPointerDown,
              onPointerMove: widget.notifier.onPointerUpdate,
              onPointerHover: widget.notifier.onPointerHover,
              onPointerCancel: widget.notifier.onPointerCancel,
              child: ClipRect(child: child), // Add ClipRect here
            ),
          ),
        );
      },
    );
  }
}
