import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutterblog/app/home/profile/add_bio.dart';
import 'package:flutterblog/app/home/profile/add_name.dart';
import 'package:flutterblog/app/home/profile/add_photo.dart';
import 'package:flutterblog/app/home/profile/add_username.dart';
import 'package:flutterblog/common_widgets/always_disabled_focus_node.dart';
import 'package:flutterblog/constants.dart';

class EditProfilePage extends StatefulWidget {
  static Future<void> create(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => EditProfilePage(),
      ),
    );
  }

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 1.0,
        backgroundColor: Colors.grey[50],
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            splashRadius: 25.0,
            icon: Icon(EvaIcons.checkmarkOutline, color: gradientColors[1]),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8.0),
            _buildProfileAvatar(
              null,
              onPressed: () => AddPhoto.show(context),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: TextEditingController(text: 'Sandip Pramanik'),
              readOnly: true,
              onTap: () => AddName.create(context),
              focusNode: AlwaysDisabledFocusNode(),
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: TextEditingController(text: '_iamsandip'),
              readOnly: true,
              onTap: () => AddUsername.create(context),
              focusNode: AlwaysDisabledFocusNode(),
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: TextEditingController(text: 'Sandip sandip sandip sandip sandip sandip sandip sandip'),
              readOnly: true,
              maxLines: 1,
              onTap: () => AddBio.create(context),
              focusNode: AlwaysDisabledFocusNode(),
              decoration: InputDecoration(
                labelText: 'Bio',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileAvatar(String imageUrl,
      {@required VoidCallback onPressed}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: CircleAvatar(
            radius: 45.0,
            backgroundColor: Colors.grey[300],
            child: ClipOval(
              child: Image.network(imageUrl ?? photoUrl, fit: BoxFit.cover),
            ),
          ),
        ),
        SizedBox(height: 12.0),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            'Change profile photo',
            style: TextStyle(
              fontSize: 16.0,
              color: gradientColors[0],
            ),
          ),
        ),
      ],
    );
  }
}
