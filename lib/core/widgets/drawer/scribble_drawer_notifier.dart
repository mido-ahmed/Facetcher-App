import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:history_state_notifier/history_state_notifier.dart';
import 'package:scribble/src/model/sketch/sketch.dart';
import 'package:scribble/src/state/scribble.state.dart';
import 'package:state_notifier/state_notifier.dart';

abstract class ScribbleDrawerNotifierBase extends StateNotifier<ScribbleState> {
  ScribbleDrawerNotifierBase(ScribbleState state) : super(state);
  GlobalKey get repaintBoundaryKey;

  void onPointerHover(PointerHoverEvent event);
  void onPointerUp(PointerUpEvent event);
  void onPointerDown(PointerDownEvent event);
  void onPointerUpdate(PointerMoveEvent event);
  void onPointerCancel(PointerCancelEvent event);
  void onPointerExit(PointerExitEvent event);

  Future<ByteData> renderImage({
    double pixelRatio = 1.0,
    ui.ImageByteFormat format = ui.ImageByteFormat.png,
  }) async {
    final RenderRepaintBoundary? renderObject =
    repaintBoundaryKey.currentContext?.findRenderObject()
    as RenderRepaintBoundary?;
    if (renderObject == null) {
      throw StateError("Tried to convert Scribble to Image, but no valid RenderObject was found!");
    }

    // Create a white canvas
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    canvas.drawColor(Colors.white, BlendMode.color);

    // Render the RepaintBoundary onto the canvas
    final boundary = renderObject.paintBounds;
    final image = await renderObject.toImage(pixelRatio: pixelRatio);
    final src = Offset.zero & boundary.size;
    final dst = Offset.zero & boundary.size * pixelRatio;
    canvas.drawImageRect(image, src, dst, Paint());

    // Convert the canvas to an Image and return its ByteData representation
    final picture = recorder.endRecording();
    final img = await picture.toImage(
      dst.width.toInt(),
      dst.height.toInt(),
    );
    return (await img.toByteData(format: format))!;
  }

}

class ScribbleDrawerNotifier extends ScribbleDrawerNotifierBase with HistoryStateNotifierMixin<ScribbleState> {
  ScribbleDrawerNotifier({
    Sketch? sketch,

    ScribblePointerMode allowedPointersMode = ScribblePointerMode.all,

    int maxHistoryLength = 30,

    this.widths = const [5, 10, 15],

    this.pressureCurve = Curves.linear,
  }) : super(
    ScribbleState.drawing(
      sketch: sketch ?? const Sketch(lines: []),
      selectedWidth: widths[0],
      allowedPointersMode: allowedPointersMode,
    ),
  ) {
    state = ScribbleState.drawing(
      sketch: sketch ?? const Sketch(lines: []),
      selectedWidth: widths[0],
      allowedPointersMode: allowedPointersMode,
    );
    this.maxHistoryLength = maxHistoryLength;
  }

  final List<double> widths;

  final Curve pressureCurve;
  Sketch get currentSketch => state.sketch;

  final GlobalKey _repaintBoundaryKey = GlobalKey();

  @override
  GlobalKey get repaintBoundaryKey => _repaintBoundaryKey;

  @override
  @protected
  ScribbleState transformHistoryState(ScribbleState historyState, ScribbleState currentState) {
    return currentState.copyWith(
      sketch: historyState.sketch,
    );
  }

  void setSketch({required Sketch sketch, bool addToUndoHistory = true}) {
    final newState = state.copyWith(
      sketch: sketch,
    );
    if (addToUndoHistory) {
      state = newState;
    } else {
      temporaryState = newState;
    }
  }

  void clear() {
    state = state.map(
      drawing: (s) => ScribbleState.drawing(
        sketch: const Sketch(lines: []),
        selectedColor: s.selectedColor,
        selectedWidth: s.selectedWidth,
        allowedPointersMode: s.allowedPointersMode,
        activePointerIds: s.activePointerIds,
        scaleFactor: s.scaleFactor,
        pointerPosition: s.pointerPosition,
      ),
      erasing: (s) => ScribbleState.erasing(
        sketch: const Sketch(lines: []),
        selectedWidth: s.selectedWidth,
        allowedPointersMode: s.allowedPointersMode,
        activePointerIds: s.activePointerIds,
        scaleFactor: s.scaleFactor,
        pointerPosition: s.pointerPosition,
      ),
    );
  }

  void setStrokeWidth(double strokeWidth) {
    temporaryState = state.copyWith(
      selectedWidth: strokeWidth,
    );
  }

  void setEraser() {
    temporaryState = ScribbleState.erasing(
      sketch: state.sketch,
      selectedWidth: state.selectedWidth,
      scaleFactor: state.scaleFactor,
      activePointerIds: state.activePointerIds,
    );
  }

  void setAllowedPointersMode(ScribblePointerMode allowedPointersMode) {
    temporaryState = state.copyWith(
      allowedPointersMode: allowedPointersMode,
    );
  }

  void setScaleFactor(double factor) {
    assert(factor >= 0);
    temporaryState = state.copyWith(
      scaleFactor: factor,
    );
  }

  void setColor(Color color) {
    temporaryState = state.map(
      drawing: (s) => ScribbleState.drawing(
        sketch: s.sketch,
        selectedColor: color.value,
        selectedWidth: s.selectedWidth,
      ),
      erasing: (s) => ScribbleState.drawing(
        sketch: s.sketch,
        selectedColor: color.value,
        selectedWidth: s.selectedWidth,
        scaleFactor: state.scaleFactor,
        activePointerIds: state.activePointerIds,
      ),
    );
  }

  @override
  void onPointerHover(PointerHoverEvent event) {
    if (!state.supportedPointerKinds.contains(event.kind)) return;
    temporaryState = state.copyWith(
      pointerPosition:
      event.distance > 10000 ? null : _getPointFromEvent(event),
    );
  }

  @override
  void onPointerDown(PointerDownEvent event) {
    if (!state.supportedPointerKinds.contains(event.kind)) return;
    ScribbleState s = state;

    // Are there already pointers on the screen?
    if (state.activePointerIds.isNotEmpty) {
      s = state.map(
          drawing: (s) =>
          // If the current line already contains something
          (s.activeLine != null && s.activeLine!.points.length > 2)
              ? _finishLineForState(s)
              : s.copyWith(
            activeLine: null,
          ),
          erasing: (s) => s);
    } else if (state is Drawing) {
      s = (state as Drawing).copyWith(
        pointerPosition: _getPointFromEvent(event),
        activeLine: SketchLine(
          points: [_getPointFromEvent(event)],
          color: (state as Drawing).selectedColor,
          width: state.selectedWidth / state.scaleFactor,
        ),
      );
    }
    temporaryState = s.copyWith(
      activePointerIds: [...state.activePointerIds, event.pointer],
    );
  }

  @override
  void onPointerUpdate(PointerMoveEvent event) {
    if (!state.supportedPointerKinds.contains(event.kind)) return;
    if (!state.active) {
      temporaryState = state.copyWith(
        pointerPosition: null,
      );
      return;
    }
    if (state is Drawing) {
      temporaryState = _addPoint(event, state).copyWith(
        pointerPosition: _getPointFromEvent(event),
      );
    } else if (state is Erasing) {
      temporaryState = _erasePoint(event).copyWith(
        pointerPosition: _getPointFromEvent(event),
      );
    }
  }

  @override
  void onPointerUp(PointerUpEvent event) {
    if (!state.supportedPointerKinds.contains(event.kind)) return;
    final pos =
    event.kind == PointerDeviceKind.mouse ? state.pointerPosition : null;
    if (state is Drawing) {
      state = _finishLineForState(_addPoint(event, state)).copyWith(
        pointerPosition: pos,
        activePointerIds:
        state.activePointerIds.where((id) => id != event.pointer).toList(),
      );
    } else if (state is Erasing) {
      state = _erasePoint(event).copyWith(
        pointerPosition: pos,
        activePointerIds:
        state.activePointerIds.where((id) => id != event.pointer).toList(),
      );
    }
  }

  @override
  void onPointerCancel(PointerCancelEvent event) {
    if (!state.supportedPointerKinds.contains(event.kind)) return;
    if (state is Drawing) {
      state = _finishLineForState(_addPoint(event, state)).copyWith(
        pointerPosition: null,
        activePointerIds:
        state.activePointerIds.where((id) => id != event.pointer).toList(),
      );
    } else if (state is Erasing) {
      state = _erasePoint(event).copyWith(
        pointerPosition: null,
        activePointerIds:
        state.activePointerIds.where((id) => id != event.pointer).toList(),
      );
    }
  }

  @override
  void onPointerExit(PointerExitEvent event) {
    if (!state.supportedPointerKinds.contains(event.kind)) return;
    temporaryState = _finishLineForState(state).copyWith(
      pointerPosition: null,
      activePointerIds:
      state.activePointerIds.where((id) => id != event.pointer).toList(),
    );
  }

  ScribbleState _addPoint(PointerEvent event, ScribbleState s) {
    if (s is Erasing || !s.active) return s;
    if (s is Drawing && s.activeLine == null) return s;
    final currentLine = (s as Drawing).activeLine!;
    final distanceToLast = currentLine.points.isEmpty
        ? double.infinity
        : (currentLine.points.last.asOffset - event.localPosition).distance;
    if (distanceToLast <= kPrecisePointerPanSlop / s.scaleFactor) return s;
    return s.copyWith(
      activeLine: currentLine.copyWith(
        points: [
          ...currentLine.points,
          _getPointFromEvent(event),
        ],
      ),
    );
  }

  ScribbleState _erasePoint(PointerEvent event) {
    return state.copyWith.sketch(
      lines: state.sketch.lines
          .where((l) => l.points.every((p) =>
      (event.localPosition - p.asOffset).distance >
          l.width + state.selectedWidth))
          .toList(),
    );
  }

  Point _getPointFromEvent(PointerEvent event) {
    final p = kIsWeb || event.pressureMin == event.pressureMax
        ? 0.5
        : (event.pressure - event.pressureMin) /
        (event.pressureMax - event.pressureMin);
    return Point(
      event.localPosition.dx,
      event.localPosition.dy,
      pressure: pressureCurve.transform(p),
    );
  }

  ScribbleState _finishLineForState(ScribbleState s) {
    if (s is Erasing || (s as Drawing).activeLine == null) {
      return s;
    }
    return s.copyWith(
      activeLine: null,
      sketch: s.sketch.copyWith(
        lines: [...s.sketch.lines, s.activeLine!],
      ),
    );
  }
}