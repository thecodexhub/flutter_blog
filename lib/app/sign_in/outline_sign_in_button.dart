import 'package:flutter/material.dart';

class OutlineSignInButton extends StatelessWidget {
  OutlineSignInButton({
    Key key,
    this.color,
    @required this.onPressed,
    this.height: 40.0,
    this.borderRadius: 6.0,
    this.child,
    this.label,
    this.textColor,
  })  : assert(label != null),
        super(key: key);
  final Widget child;
  final Color color;
  final VoidCallback onPressed;
  final double height;
  final double borderRadius;
  final String label;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: color),
        ),
        color: Colors.transparent,
        elevation: 0,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15.0,
            color: textColor,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
