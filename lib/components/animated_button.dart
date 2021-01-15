import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({
    @required this.onPressed,
    @required this.backgroundColor,
    @required this.child,
    this.height,
    this.width,
  });

  final Function onPressed;
  final Color backgroundColor;
  final Widget child;
  final double height;
  final double width;

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _fadeAnimation = Tween<double>(
      begin: 1,
      end: 0.5,
    ).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) async {
        await _animationController.forward();
      },
      onTapUp: (details) {
        _animationController.reverse();
        widget.onPressed();
      },
      onTapCancel: () {
        _animationController.reverse();
      },
      child: AnimatedBuilder(
        animation: _fadeAnimation,
        builder: (context, child) {
          return Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              color: widget.backgroundColor.withOpacity(_fadeAnimation.value),
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.16 * _fadeAnimation.value),
                  offset: const Offset(0, 3),
                  blurRadius: 6,
                )
              ],
            ),
            child: Center(
              child: Opacity(
                opacity: _fadeAnimation.value,
                child: widget.child,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
