import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    Key key,
    this.color,
    @required this.onPressed,
    this.height: 45.0,
    this.borderRadius: 6.0,
    this.elevation: 2.0,
    this.border: BorderSide.none,
    this.child,
  }) : super(key: key);
  final Widget child;
  final Color color;
  final VoidCallback onPressed;
  final double height;
  final double elevation;
  final double borderRadius;
  final BorderSide border;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: border,
        ),
        elevation: elevation,
        color: color,
        disabledColor: color,
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}
