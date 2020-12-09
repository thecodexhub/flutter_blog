import 'package:flutter/material.dart';
import 'package:flutterblog/constants.dart';

class AppTitle extends StatelessWidget {
  AppTitle({
    Key key,
    @required this.leftMargin,
    this.fontSize,
  }) : super(key: key);
  final double leftMargin;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      appName,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        foreground: Paint()
          ..shader = LinearGradient(colors: [
            Colors.deepPurple[800],
            Colors.pink,
          ]).createShader(Rect.fromLTWH(leftMargin, 0, 120, 35)),
      ),
    );
  }
}
