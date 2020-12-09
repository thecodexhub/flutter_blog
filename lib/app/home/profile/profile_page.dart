import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutterblog/app/home/profile/add_bio.dart';
import 'package:flutterblog/app/home/profile/add_photo.dart';
import 'package:flutterblog/app/home/profile/complete_profile_card.dart';
import 'package:flutterblog/app/home/profile/edit_profile_button.dart';
import 'package:flutterblog/app/home/profile/edit_profile_page.dart';
import 'package:flutterblog/common_widgets/empty_content.dart';
import 'package:flutterblog/common_widgets/platform_alert_dialog.dart';
import 'package:flutterblog/constants.dart';
import 'package:flutterblog/services/auth.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      defaultActionText: 'Logout',
      cancelActionText: 'Cancel',
    ).show(context);
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 1.0,
        backgroundColor: Colors.grey[50],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: _buildProfileInfo(),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: EditProfileButton(
                label: 'Edit Profile',
                color: Colors.grey[50],
                textColor: Colors.black87,
                onPressed: () => EditProfilePage.create(context),
              ),
            ),
            _buildLogOutButton(context),
            SizedBox(height: 16.0),
            Divider(thickness: 2.0),
            EmptyContent(
              title: 'Profile',
              content:
                  'When you share blogs and stories, they\'ll appear on your profile',
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                'Complete your profile',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 4.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text.rich(
                TextSpan(
                  text: '0 OF 4 ',
                  style: TextStyle(
                    fontSize: 11.0,
                    color: gradientColors[1],
                  ),
                  children: [
                    TextSpan(
                      text: 'COMPLETE',
                      style: TextStyle(
                        fontSize: 11.0,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return null;
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 12.0),
                    CompleteProfileCard(
                      title: 'Add your name',
                      subtitle:
                          'Add your full name so that your friends know it\'s you',
                      icon: EvaIcons.personOutline,
                      actionButtonText: 'Add Name',
                      onPressed: () => EditProfilePage.create(context),
                    ),
                    SizedBox(width: 12.0),
                    CompleteProfileCard(
                      title: 'Add profile photo',
                      subtitle:
                          'Choose a profile photo to represent yourself on $appName',
                      icon: EvaIcons.cameraOutline,
                      actionButtonText: 'Add Photo',
                      onPressed: () => AddPhoto.show(context),
                    ),
                    SizedBox(width: 12.0),
                    CompleteProfileCard(
                      title: 'Add username',
                      subtitle:
                          'Create a unique username to represent yourself on $appName',
                      icon: EvaIcons.personDoneOutline,
                      actionButtonText: 'Add username',
                      onPressed: () => EditProfilePage.create(context),
                    ),
                    SizedBox(width: 12.0),
                    CompleteProfileCard(
                      title: 'Add bio',
                      subtitle:
                          'Tell your followers a little bit about yourself',
                      icon: EvaIcons.messageCircleOutline,
                      actionButtonText: 'Add Bio',
                      onPressed: () => AddBio.create(context),
                    ),
                    SizedBox(width: 12.0),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Row(
      children: [
        CircleAvatar(
          radius: 45.0,
          backgroundColor: Colors.grey[350],
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: 60.0,
          ),
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sandip Pramanik',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 6.0),
              Text(
                'Writer/Artist',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLogOutButton(BuildContext context) {
    return FlatButton(
      onPressed: () => _confirmSignOut(context),
      child: Text(
        'Log out',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
