import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterblog/app/sign_in/sign_in_bloc.dart';
import 'package:flutterblog/app/sign_in/sign_in_model.dart';
import 'package:flutterblog/app/sign_in/sign_in_button.dart';
import 'package:flutterblog/app/sign_in/social_sign_in_button.dart';
import 'package:flutterblog/common_widgets/app_icon.dart';
import 'package:flutterblog/common_widgets/platform_alert_dialog.dart';
import 'package:flutterblog/common_widgets/platform_exception_alert_dialog.dart';
import 'package:flutterblog/services/auth.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key, @required this.bloc}) : super(key: key);
  final SignInBloc bloc;

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return Provider<SignInBloc>(
      create: (_) => SignInBloc(auth: auth),
      dispose: (context, bloc) => bloc.dispose(),
      child: Consumer<SignInBloc>(
        builder: (context, bloc, _) {
          return SignInPage(
            bloc: bloc,
          );
        },
      ),
    );
  }

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _obscurePassword = true;

  void _showSignInError(BuildContext context, PlatformException exception) {
    PlatformExceptionAlertDialog(
      title: 'Sign in failed',
      exception: exception,
    ).show(context);
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await widget.bloc.signInWithGoogle();
    } on PlatformException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      await widget.bloc.signInWithFacebook();
    } on PlatformException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    }
  }

  void _toggleForm() {
    widget.bloc.toggleFormType();
    _usernameController.clear();
    _emailController.clear();
    _passwordController.clear();
  }

  Future<void> _submit() async {
    try {
      await widget.bloc.submit();
    } catch (e) {
      PlatformAlertDialog(
        title: 'Sign in failed',
        content: e.message,
        defaultActionText: 'OK',
      ).show(context);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _usernameFocusNode.dispose();
    super.dispose();
  }

  Widget _buildPasswordTextField(EmailSignInModel model) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.black),
      child: TextField(
        controller: _passwordController,
        focusNode: _passwordFocusNode,
        cursorColor: Colors.black,
        obscureText: _obscurePassword,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[300],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
          hintText: 'Password',
          errorText: model.passwordErrorText,
          enabled: model.isLoading == false,
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
              size: 20.0,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
        ),
        onChanged: widget.bloc.updatePassword,
      ),
    );
  }

  Widget _buildEmailTextField(EmailSignInModel model) {
    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[300],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
        hintText: 'Email',
        errorText: model.emailErrorText,
        enabled: model.isLoading == false,
      ),
      onChanged: widget.bloc.updateEmail,
    );
  }

  Widget _buildUsernameTextField(EmailSignInModel model) {
    return TextField(
      controller: _usernameController,
      focusNode: _usernameFocusNode,
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[300],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
        hintText: 'Full name',
        errorText: model.usernameErrorText,
        enabled: model.isLoading == false,
      ),
      onChanged: widget.bloc.updateUsername,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<EmailSignInModel>(
          stream: widget.bloc.modelStream,
          initialData: EmailSignInModel(),
          builder: (context, snapshot) {
            final EmailSignInModel model = snapshot.data;
            return _buildContent(context, model);
          }),
    );
  }

  Widget _buildContent(BuildContext context, EmailSignInModel model) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: MediaQuery.of(context).padding.top,
          ),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.0),
                AppIcon(),
                SizedBox(height: 12.0),
                _buildHeader(),
                SizedBox(height: 30.0),
                model.showUsernameTextField ? _buildUsernameTextField(model) : Container(),
                model.showUsernameTextField ? SizedBox(height: 12.0) : Container(),
                _buildEmailTextField(model),
                SizedBox(height: 12.0),
                _buildPasswordTextField(model),
                SizedBox(height: 12.0),
                model.showUsernameTextField
                    ? Container()
                    : _forgotPassword(
                        onPressed: () {},
                      ),
                model.showUsernameTextField ? Container() : SizedBox(height: 12.0),
                SignInButton(
                  label: model.signInButtonText,
                  color: Colors.black87,
                  textColor: Colors.white,
                  onPressed: model.canSubmit ? _submit : null,
                ),
                SizedBox(height: 6.0),
                _buildFormToggle(
                  primaryText: model.primaryText,
                  secondaryText: model.secondaryText,
                  onPressed: model.isLoading ? null : _toggleForm,
                ),
                SizedBox(height: 30.0),
                _buildSocialSignInButtons(model),
                SizedBox(height: 30.0),
              ],
            ),
          ),
        ),
        model.isLoading
            ? Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.grey[400].withOpacity(0.5),
                child: Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

  Widget _buildSocialSignInButtons(EmailSignInModel model) {
    final String actionText = model.formType == SignInFormType.logIn
        ? 'Or sign in with'
        : 'Or sign up with';
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(thickness: 1.5, color: Colors.black26)),
            SizedBox(width: 12.0),
            Text(
              actionText,
              style: TextStyle(color: Colors.grey[700], fontSize: 12.0),
            ),
            SizedBox(width: 12.0),
            Expanded(child: Divider(thickness: 1.5, color: Colors.black26)),
          ],
        ),
        SizedBox(height: 18.0),
        Row(
          children: [
            Expanded(
              child: SocialSignInButton(
                color: Color(0xFF334A92),
                assetName: 'images/facebook-logo.png',
                label: 'Facebook',
                textColor: Colors.white,
                onPressed:
                    model.isLoading ? null : () => _signInWithFacebook(context),
              ),
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: SocialSignInButton(
                color: Colors.grey[50],
                assetName: 'images/google-logo.png',
                label: 'Google',
                textColor: Colors.black87,
                border: BorderSide(color: Colors.black26, width: 1.5),
                onPressed:
                    model.isLoading ? null : () => _signInWithGoogle(context),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFormToggle(
      {String primaryText, String secondaryText, VoidCallback onPressed}) {
    return FlatButton(
      height: 45.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            primaryText,
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          Text(
            secondaryText,
            style: TextStyle(
              color: Colors.pink,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _forgotPassword({VoidCallback onPressed}) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: onPressed,
        child: Text(
          'Forgot password?',
          style: TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          'Welcome to ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '.blog',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            foreground: Paint()
              ..shader = LinearGradient(colors: [
                Colors.deepPurple[800],
                Colors.pink,
              ]).createShader(Rect.fromLTWH(160, 0, 85, 35)),
          ),
        ),
      ],
    );
  }
}
