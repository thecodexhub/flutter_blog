import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    Key key,
    this.color,
    @required this.onPressed,
    this.height: 40.0,
    this.borderRadius: 6.0,
    this.child,
  }) : super(key: key);
  final Widget child;
  final Color color;
  final VoidCallback onPressed;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        color: color,
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}
