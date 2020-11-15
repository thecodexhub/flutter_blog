import 'package:flutter/material.dart';
import 'package:flutterblog/common_widgets/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  final String label;
  final String assetName;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  SocialSignInButton({this.label, this.assetName, this.color, this.textColor, this.onPressed})
      : assert(label != null, assetName != null),
        super(
          onPressed: onPressed,
          color: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(assetName),
              Text(
                label,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              Opacity(opacity: 0, child: Image.asset(assetName)),
            ],
          ),
        );
}
