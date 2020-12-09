import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class AddPhoto extends StatelessWidget {
  static Future<void> show(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (builder) {
        return AddPhoto();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 12.0),
          width: 40.0,
          height: 4.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.grey[400],
          ),
        ),
        SizedBox(height: 30.0),
        ListTile(
          leading: Icon(EvaIcons.cameraOutline),
          title: Text('Choose image using camera'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(EvaIcons.imageOutline),
          title: Text('Choose image from gallery'),
          onTap: () {},
        ),
      ],
    );
  }
}
