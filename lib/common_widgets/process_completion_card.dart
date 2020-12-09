import 'package:flutter/material.dart';
import 'package:flutterblog/common_widgets/gradient_flat_button.dart';

class ProcessCompletionCard extends StatelessWidget {
  ProcessCompletionCard({
    Key key,
    this.height: 28.0,
    this.elevation: 0.0,
    this.borderRadius: 4.0,
    @required this.title,
    @required this.subtitle,
    @required this.icon,
    @required this.actionButtonText,
    this.onPressed,
  }) : super(key: key);
  final double height;
  final double elevation;
  final double borderRadius;
  final String title;
  final String subtitle;
  final IconData icon;
  final String actionButtonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.black,
                  size: 45.0,
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 12.0),
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
      ),
    );
  }
}
