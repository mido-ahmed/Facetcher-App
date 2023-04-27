import 'package:facetcher/core/utils/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:scribble/scribble.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/drawer/scribble_drawer_notifier.dart';

class DrawerToolbar extends StatelessWidget {
  final ScribbleDrawerNotifier notifier;
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
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildUndoButton(context),
                  _buildRedoButton(context),
                  _buildClearButton(context),
                  _buildColorButton(context, color: AppColors.black, isSelected: state is Drawing),
                  _buildEraserButton(context, isSelected: state is Erasing),
                  const SizedBox(width: 10,),
                  _buildStrokeToolbar(context),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Divider(height: 1.5, color: Colors.grey,),
              ),
            ],
          ),
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
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Material(
        elevation: selected ? 5 : 0,
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
                  erasing: (_) => AppColors.textSecondary,
                ),
                border: state.map(
                  drawing: (_) => selected ? Border.all(width: 3, color: AppColors.textSecondary2) : null,
                  erasing: (_) => selected ? Border.all(width: 3, color: AppColors.textSecondary2) : null,
                ),
                borderRadius: BorderRadius.circular(50.0)),
          ),
        ),
      ),
    );
  }

  Widget _buildEraserButton(BuildContext context, {required bool isSelected}) {
    return FloatingActionButton.small(
      tooltip: "Erase",
      backgroundColor: Colors.transparent,
      elevation: 0,
      onPressed: notifier.setEraser,
      child: isSelected ? Image.network(ImageNetwork.eraserFilledIcon, width: 24, height: 24,)
          : Image.network(ImageNetwork.eraserIcon, width: 24, height: 24,),
    );
  }

  Widget _buildColorButton(
      BuildContext context, {
        required Color color,
        required bool isSelected,
      }) {
    return FloatingActionButton.small(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: isSelected ? Image.network(ImageNetwork.penFilledIcon, width: 24, height: 24,)
            : Image.network(ImageNetwork.penIcon, width: 24, height: 24,),
        onPressed: () => notifier.setColor(color));
  }

  Widget _buildUndoButton(BuildContext context) {
    return FloatingActionButton.small(
      tooltip: "Undo",
      onPressed: notifier.canUndo ? notifier.undo : null,
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Image.network(ImageNetwork.undoIcon, width: 24, height: 24,),
    );
  }

  Widget _buildRedoButton(BuildContext context) {
    return FloatingActionButton.small(
      tooltip: "Redo",
      onPressed: notifier.canRedo ? notifier.redo : null,
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Image.network(ImageNetwork.redoIcon, width: 24, height: 24,),
    );
  }

  Widget _buildClearButton(BuildContext context) {
    return FloatingActionButton.small(
      tooltip: "Clear",
      onPressed: notifier.clear,
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Image.network(ImageNetwork.binIcon, width: 24, height: 24,),
    );
  }
}