import 'package:flutter/material.dart';
import 'package:flutterblog/constants.dart';

class AppIcon extends StatelessWidget {
  AppIcon({
    Key key,
    this.size: 45.0,
    this.radius: 8.0,
    this.fontSize: 26.0,
  }) : super(key: key);
  final double size;
  final double radius;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.deepPurple[800],
            Colors.pink,
          ],
        ),
      ),
      child: Center(
        child: Text(
          appName[0],
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
