import 'package:flutter/material.dart';
import 'package:flutterblog/common_widgets/gradient_flat_button.dart';

class CompleteProfileCard extends StatelessWidget {
  CompleteProfileCard({
    Key key,
    this.height: 28.0,
    this.borderRadius: 4.0,
    @required this.title,
    @required this.subtitle,
    @required this.icon,
    @required this.actionButtonText,
    this.onPressed,
  }) : super(key: key);
  final double height;
  final double borderRadius;
  final String title;
  final String subtitle;
  final IconData icon;
  final String actionButtonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 20.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: Colors.black26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black26,
                width: 2.0,
              ),
            ),
            child: Center(
              child: Icon(
                icon,
                color: Colors.black26,
                size: 30.0,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 8.0),
          SizedBox(
            height: height,
            child: GradientFlatButton(
              child: Text(
                actionButtonText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                ),
              ),
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
