import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutterblog/constants.dart';
import 'package:flutterblog/presentation/strings.dart';

class AddUsername extends StatefulWidget {
  static Future<void> create(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => AddUsername(),
      ),
    );
  }

  @override
  _AddUsernameState createState() => _AddUsernameState();
}

class _AddUsernameState extends State<AddUsername> {
  final FocusNode _usernameFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 2.0,
        title: Text(
          'Username',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            splashRadius: 25.0,
            icon: Icon(EvaIcons.checkmarkOutline, color: gradientColors[1]),
            onPressed: () {
              _usernameFocusNode.unfocus();
              if (!_usernameFocusNode.hasPrimaryFocus) {
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8.0),
              TextField(
                focusNode: _usernameFocusNode,
                cursorColor: gradientColors[0],
                keyboardType: TextInputType.text,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.black45),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                Strings.usernameHelperText,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black45,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'You can change your username anytime later.',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
