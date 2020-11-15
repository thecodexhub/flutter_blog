import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterblog/app/sign_in/outline_sign_in_button.dart';
import 'package:flutterblog/app/sign_in/sign_in_button.dart';
import 'package:flutterblog/common_widgets/background_widget.dart';
import 'package:flutterblog/services/auth.dart';
import 'package:provider/provider.dart';

enum EmailSignInFormType { logIn, register }

class EmailSignInPage extends StatefulWidget {
  static Future<void> create(BuildContext context) async {
    await Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => EmailSignInPage(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _EmailSignInPageState createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();


  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  String get _username => _usernameController.text;

  EmailSignInFormType _formType = EmailSignInFormType.logIn;

  void _toggleFormType() {
    setState(() {
      _formType = _formType == EmailSignInFormType.logIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.logIn;
    });
    _emailController.clear();
    _passwordController.clear();
    _usernameController.clear();
  }

  Future<void> _submit() async {
    _passwordFocusNode.unfocus();
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      if (_formType == EmailSignInFormType.logIn) {
        await auth.signInWithEmailAndPassword(_email, _password);
      } else {
        await auth.createUserWithEmailAndPassword(_email, _password, _username);
      }
      Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
    }
  }

  void _usernameEditingComplete() {
    FocusScope.of(context).requestFocus(_emailFocusNode);
  }

  void _emailEditingComplete() {
    FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

  Widget _buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      cursorColor: Colors.white,
      style: TextStyle(
        fontSize: 15.0,
        color: Colors.white,
      ),
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        labelText: 'PASSWORD',
        labelStyle:
            TextStyle(fontSize: 15.0, color: Colors.white, letterSpacing: 1.2),
        hintText: 'Enter your password',
        hintStyle: TextStyle(
          fontSize: 14.0,
          color: Colors.grey[200].withOpacity(0.7),
        ),
      ),
      onEditingComplete: _submit,
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      cursorColor: Colors.white,
      style: TextStyle(
        fontSize: 15.0,
        color: Colors.white,
      ),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        labelText: 'EMAIL',
        labelStyle:
            TextStyle(fontSize: 15.0, color: Colors.white, letterSpacing: 1.2),
        hintText: 'Enter your email address',
        hintStyle: TextStyle(
          fontSize: 14.0,
          color: Colors.grey[200].withOpacity(0.7),
        ),
      ),
      onEditingComplete: _emailEditingComplete,
    );
  }

  Widget _buildUsernameTextField() {
    return TextField(
      controller: _usernameController,
      focusNode: _usernameFocusNode,
      cursorColor: Colors.white,
      style: TextStyle(
        fontSize: 15.0,
        color: Colors.white,
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        labelText: 'YOUR NAME',
        labelStyle:
            TextStyle(fontSize: 15.0, color: Colors.white, letterSpacing: 1.2),
        hintText: 'Eg: John Black',
        hintStyle: TextStyle(
          fontSize: 14.0,
          color: Colors.grey[200].withOpacity(0.7),
        ),
      ),
      onEditingComplete: _usernameEditingComplete,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          BackgroundWidget(opacity: 1.0),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    final label = _formType == EmailSignInFormType.logIn
        ? 'New to this experience? Register'
        : 'Already have an account? Login';
    return Padding(
      padding: EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: 12.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: _buildEmailSignInContent(context),
            ),
            SizedBox(height: 12.0),
            OutlineSignInButton(
              color: Colors.white,
              label: label,
              textColor: Colors.white,
              onPressed: _toggleFormType,
            ),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailSignInContent(BuildContext context) {
    final label = _formType == EmailSignInFormType.logIn ? 'Login' : 'Register';
    final showUsername = _formType == EmailSignInFormType.register;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        showUsername == true ? _buildUsernameTextField() : Container(),
        SizedBox(height: 8.0),
        _buildEmailTextField(),
        SizedBox(height: 8.0),
        _buildPasswordTextField(),
        SizedBox(height: 18.0),
        SignInButton(
          color: Colors.white,
          label: label,
          textColor: Colors.pinkAccent[700],
          onPressed: _submit,
        ),
      ],
    );
  }
}
