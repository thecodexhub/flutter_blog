import 'package:flutter/material.dart';
import 'package:flutterblog/common_widgets/custom_raised_button.dart';

class EditProfileButton extends CustomRaisedButton {
  final String label;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  EditProfileButton({this.label, this.color, this.textColor, this.onPressed})
      : assert(label != null),
        super(
          onPressed: onPressed,
          elevation: 0,
          height: 35,
          border: BorderSide(color: Colors.black87),
          color: color,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        );
}
