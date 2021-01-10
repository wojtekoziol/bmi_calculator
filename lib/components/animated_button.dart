import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({
    @required this.onPressed,
    @required this.height,
    @required this.width,
    @required this.backgroundColor,
    @required this.child,
  });

  final Function onPressed;
  final double height;
  final double width;
  final Color backgroundColor;
  final Widget child;

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(
        child: widget.child,
      ),
    );
  }
}
