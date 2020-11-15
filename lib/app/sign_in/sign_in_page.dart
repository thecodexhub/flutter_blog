import 'package:flutter/material.dart';
import 'package:flutterblog/app/sign_in/email_sign_in_page.dart';
import 'package:flutterblog/app/sign_in/sign_in_button.dart';
import 'package:flutterblog/app/sign_in/social_sign_in_button.dart';
import 'package:flutterblog/common_widgets/background_widget.dart';
import 'package:flutterblog/services/auth.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  Future<void> _signInWithGoogle(BuildContext context) async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    try {
      await auth.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(context),
          BackgroundWidget(opacity: 0.7),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: MediaQuery.of(context).padding.top + 40.0,
        bottom: 20.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildHeaderContent(context),
          SizedBox(height: 80.0),
          Expanded(
            child: _buildSignInContent(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSignInContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SignInButton(
          color: Colors.white,
          label: 'Login or Register with Email',
          textColor: Colors.pinkAccent[700],
          onPressed: () => EmailSignInPage.create(context),
        ),
        SizedBox(height: 18.0),
        _dividerText(),
        SizedBox(height: 18.0),
        SocialSignInButton(
          color: Colors.white,
          assetName: 'images/google-logo.png',
          label: 'Sign in using Google',
          textColor: Colors.black87,
          onPressed: () => _signInWithGoogle(context),
        ),
        SizedBox(height: 12.0),
        SocialSignInButton(
          color: Color(0xFF334A92),
          assetName: 'images/facebook-logo.png',
          label: 'Sign in using Facebook',
          textColor: Colors.white,
          onPressed: () => _signInWithFacebook(context),
        ),
        SizedBox(height: 28.0),
        Divider(color: Colors.grey[100]),
        Text(
          'Made by @thecodexhub, V1.0.0.1',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[100],
            fontSize: 11.0,
            letterSpacing: 1.6,
          )
        ),
      ],
    );
  }

  Widget _buildHeaderContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '.blog',
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(height: 12.0),
        Text(
          '\"Opportunities don\'t happen. You create them.\"',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(height: 18.0),
        Container(
          height: 5.0,
          width: 50.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ],
    );
  }

  Widget _buildBackgroundImage(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Image.asset(
        'images/login.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _dividerText() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey[100],
          ),
        ),
        SizedBox(width: 12.0),
        Text(
          'or continue with',
          style: TextStyle(
            color: Colors.grey[100],
            fontSize: 13.0,
          ),
        ),
        SizedBox(width: 12.0),
        Expanded(
          child: Divider(
            color: Colors.grey[100],
          ),
        ),
      ],
    );
  }
}
