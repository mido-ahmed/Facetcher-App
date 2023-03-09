import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AnimatedIconButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Color color;
  final double size;
  final AnimatedIconData icon;
  final int durationMilliseconds;
  final double? begin;
  final double? end;

  const AnimatedIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.color,
    required this.size,
    required this.durationMilliseconds,
    this.begin = 0.0,
    this.end = 1.0,
  }) : super(key: key);

  @override
  State<AnimatedIconButton> createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.durationMilliseconds),
    );
    _animation =
        Tween<double>(begin: widget.begin ?? 0.0, end: widget.end ?? 1.0)
            .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleAnimation() {
    if (_isPlaying) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    _isPlaying = !_isPlaying;
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleAnimation,
      child: AnimatedIcon(
        icon: widget.icon,
        progress: _animation,
        color: widget.color,
        size: widget.size,
      ),
    );
  }
}
