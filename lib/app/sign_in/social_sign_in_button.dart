import 'package:flutter/material.dart';
import 'package:flutterblog/common_widgets/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  final String label;
  final String assetName;
  final Color color;
  final Color textColor;
  final BorderSide border;
  final VoidCallback onPressed;

  SocialSignInButton({
    this.label,
    this.assetName,
    this.color,
    this.border: BorderSide.none,
    this.textColor,
    this.onPressed,
  })  : assert(label != null, assetName != null),
        super(
          onPressed: onPressed,
          borderRadius: 10.0,
          color: color,
          border: border,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(assetName, height: 20.0),
              SizedBox(width: 8.0),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ],
          ),
        );
}
