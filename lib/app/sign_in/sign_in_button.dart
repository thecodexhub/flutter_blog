import 'package:flutter/material.dart';
import 'package:flutterblog/common_widgets/custom_raised_button.dart';

class SignInButton extends CustomRaisedButton {
  final String label;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  SignInButton({this.label, this.color, this.textColor, this.onPressed})
      : assert(label != null),
        super(
          onPressed: onPressed,
          color: color,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        );
}
