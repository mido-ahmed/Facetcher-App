import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/core/utils/app_colors.dart';
import 'package:flutter_starter/core/utils/app_text_style.dart';

class AnimatedCircleContainer extends StatefulWidget {
  @override
  _AnimatedCircleContainerState createState() =>
      _AnimatedCircleContainerState();
}

class _AnimatedCircleContainerState extends State<AnimatedCircleContainer>
    with SingleTickerProviderStateMixin {
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
        curve:
            Curves.easeInOut)); // Add a curve to make the transition smoother
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
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 175,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.navigatorFont,
                border: Border.all(),
                borderRadius: BorderRadiusDirectional.circular(25),
              ),
              child: Center(
                  child: Text(
                "Start drawing",
                style: AppTextStyle.animatedButtonText,
                textAlign: TextAlign.center,
              )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
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
                      height: 90,
                      decoration: BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: Colors.grey, //New
                        //       blurRadius: 25.0,
                        //       offset: Offset(0, -10))
                        // ],
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
          Positioned(
            right: 15.0,
            top: 25.0,
            child: _isMovedLeft ? _buildButton() : SizedBox(),
          ),
        ],
      ),
    );
  }
}
