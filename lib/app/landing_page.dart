import 'package:flutter/material.dart';
import 'package:flutterblog/app/home/bottom_navigation_view/bottom_navigation_view.dart';
import 'package:flutterblog/app/sign_in/sign_in_page.dart';
import 'package:flutterblog/services/app_user.dart';
import 'package:flutterblog/services/auth.dart';
import 'package:flutterblog/services/database.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<AppUser>(
      stream: auth.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          AppUser appUser = snapshot.data;
          if (appUser == null) {
            return SignInPage.create(context);
          }
          return Provider<AppUser>.value(
            value: appUser,
            child: Provider<Database>(
              create: (context) => FirestoreDatabase(),
              child: BottomNavigationView.create(context),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
