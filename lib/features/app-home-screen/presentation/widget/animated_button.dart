import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:facetcher/core/utils/app_colors.dart';
import 'package:facetcher/core/utils/app_text_style.dart';

import '../../../../config/routes/app_routes.dart';

class AnimatedCircleContainer extends StatefulWidget {
  const AnimatedCircleContainer({super.key});

  @override
  State<AnimatedCircleContainer> createState() => _AnimatedCircleContainerState();
}

class _AnimatedCircleContainerState extends State<AnimatedCircleContainer> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationRotation;
  late Animation<Offset> _animationPosition;
  bool _isMovedLeft = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animationRotation = Tween<double>(
      begin: 180,
      end: 0,
    ).animate(_animationController);
    _animationPosition = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-12 / 50, 0.0),
    ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMoveLeft() {
    setState(() {
      if (_isMovedLeft) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
      _isMovedLeft = !_isMovedLeft;
    });
  }

  Widget _buildButton() {
    return SlideTransition(
      position: _animationPosition,
      child: TextButton(
        onPressed: () { Navigator.pushNamed(context, Routes.appDrawingDetails); },
        child: Container(
          width: 175,
          height: 34,
          decoration: BoxDecoration(
            color: AppColors.navigatorFont,
            border: Border.all(),
            borderRadius: BorderRadiusDirectional.circular(25),
          ),
          child: Center(
            child: Text("Start drawing",
              style: AppTextStyle.animatedButtonText,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 15.0,
          top: 30.0,
          child: _isMovedLeft ? _buildButton() : const SizedBox(),
        ),
        GestureDetector(
          onTap: _toggleMoveLeft,
          child: SlideTransition(
            position: _animationPosition,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _animationRotation.value * (3.14 / 180),
                      child: child,
                    );
                  },
                  child: Container(
                    width: 90,
                    height: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.navigatorItem,
                    ),
                    child: Icon(
                      Icons.add,
                      size: 50,
                      color: AppColors.navigatorFont,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
