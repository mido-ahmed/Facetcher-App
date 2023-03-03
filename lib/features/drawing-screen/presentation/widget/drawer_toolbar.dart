import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:scribble/scribble.dart';

import '../../../../core/utils/app_colors.dart';
import 'drawer_widget.dart';

class DrawerToolbar extends StatelessWidget {
  final ScribbleNotifier notifier;
  final BuildContext context;

  const DrawerToolbar({
    Key? key,
    required this.notifier,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder<ScribbleState>(
      stateNotifier: notifier,
      builder: (context, state, _) => Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildUndoButton(context),
            const Divider(
              height: 2.0,
            ),
            _buildRedoButton(context),
            const Divider(
              height: 2.0,
            ),
            _buildClearButton(context),
            const Divider(
              height: 4.0,
            ),
            _buildEraserButton(context, isSelected: state is Erasing),
            _buildColorButton(context,
                color: AppColors.black,
                state: state,
                icon: const Icon(Icons.add)),
            _buildStrokeToolbar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStrokeToolbar(BuildContext context) {
    List<double> strokeWidths = [5, 4, 3];
    return StateNotifierBuilder<ScribbleState>(
      stateNotifier: notifier,
      builder: (context, state, _) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (final strokeWidth in strokeWidths)
            _buildStrokeButton(context, strokeWidth: strokeWidth, state: state),
        ],
      ),
    );
  }

  Widget _buildStrokeButton(
    BuildContext context, {
    required double strokeWidth,
    required ScribbleState state,
  }) {
    final selected = state.selectedWidth == strokeWidth;
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Material(
        elevation: selected ? 4 : 0,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: () => notifier.setStrokeWidth(strokeWidth),
          customBorder: const CircleBorder(),
          child: AnimatedContainer(
            duration: kThemeAnimationDuration,
            width: strokeWidth * strokeWidth + 1,
            height: strokeWidth * strokeWidth + 1,
            decoration: BoxDecoration(
                color: state.map(
                  drawing: (s) => Color(s.selectedColor),
                  erasing: (_) => Colors.transparent,
                ),
                border: state.map(
                  drawing: (_) => null,
                  erasing: (_) => Border.all(width: 5),
                ),
                borderRadius: BorderRadius.circular(50.0)),
          ),
        ),
      ),
    );
  }

  Widget _buildEraserButton(BuildContext context, {required bool isSelected}) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: FloatingActionButton.small(
        tooltip: "Erase",
        backgroundColor: const Color(0xFFF7FBFF),
        elevation: isSelected ? 10 : 2,
        shape: !isSelected
            ? const CircleBorder()
            : RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),
        onPressed: notifier.setEraser,
        child: const Icon(Icons.remove, color: Colors.blueGrey),
      ),
    );
  }

  Widget _buildColorButton(
    BuildContext context, {
    required Color color,
    required ScribbleState state,
    required Icon icon,
  }) {
    final isSelected = state is DrawerWidget == color.value;
    return Padding(
      padding: const EdgeInsets.all(4),
      child: FloatingActionButton.small(
          backgroundColor: color,
          elevation: isSelected ? 10 : 2,
          shape: !isSelected
              ? const CircleBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
          child: Container(),
          onPressed: () => notifier.setColor(color)),
    );
  }

  Widget _buildUndoButton(BuildContext context) {
    return FloatingActionButton.small(
      tooltip: "Undo",
      onPressed: notifier.canUndo ? notifier.undo : null,
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: const Icon(
        Icons.undo_rounded,
        color: Colors.white,
      ),
    );
  }

  Widget _buildRedoButton(BuildContext context) {
    return FloatingActionButton.small(
      tooltip: "Redo",
      onPressed: notifier.canRedo ? notifier.redo : null,
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: const Icon(
        Icons.redo_rounded,
        color: Colors.white,
      ),
    );
  }

  Widget _buildClearButton(BuildContext context) {
    return FloatingActionButton.small(
      tooltip: "Clear",
      onPressed: notifier.clear,
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: const Icon(Icons.delete_forever),
    );
  }
}
