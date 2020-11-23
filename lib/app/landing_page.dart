import 'package:flutter/material.dart';
import 'package:flutterblog/app/home/home_page.dart';
import 'package:flutterblog/app/sign_in/sign_in_page.dart';
import 'package:flutterblog/services/auth.dart';
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
          return HomePage(appUser: appUser);
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
