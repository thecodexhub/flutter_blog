import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutterblog/constants.dart';

class AddBio extends StatefulWidget {
  static Future<void> create(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => AddBio(),
      ),
    );
  }

  @override
  _AddBioState createState() => _AddBioState();
}

class _AddBioState extends State<AddBio> {
  final FocusNode _bioFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 2.0,
        title: Text(
          'Bio',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            splashRadius: 25.0,
            icon: Icon(EvaIcons.checkmarkOutline, color: gradientColors[1]),
            onPressed: () {
              _bioFocusNode.unfocus();
              if (!_bioFocusNode.hasPrimaryFocus) {
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                focusNode: _bioFocusNode,
                cursorColor: gradientColors[0],
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
                maxLength: 150,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: gradientColors[1]),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 3.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
