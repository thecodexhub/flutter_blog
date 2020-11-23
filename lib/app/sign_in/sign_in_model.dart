import 'package:flutterblog/app/sign_in/validators.dart';

enum SignInFormType { logIn, register }

class EmailSignInModel with UsernameEmailAndPasswordValidators {
  EmailSignInModel({
    this.username = '',
    this.email = '',
    this.password = '',
    this.formType = SignInFormType.logIn,
    this.submitted = false,
    this.isLoading = false,
  });

  final String username;
  final String email;
  final String password;
  final SignInFormType formType;
  final bool submitted;
  final bool isLoading;

  String get signInButtonText {
    return formType == SignInFormType.logIn ? 'Log in' : 'Register';
  }

  String get primaryText {
    return formType == SignInFormType.logIn
        ? 'Not a member? '
        : 'Already a member? ';
  }

  String get secondaryText {
    return formType == SignInFormType.logIn ? 'Join now' : 'Log in';
  }

  bool get showUsernameTextField {
    return formType == SignInFormType.logIn ? false : true;
  }

  bool get canSubmit {
    return formType == SignInFormType.logIn
        ? emailValidator.isValid(email) &&
            passwordValidator.isValid(password) &&
            !isLoading
        : usernameValidator.isValid(username) &&
            emailValidator.isValid(email) &&
            passwordValidator.isValid(password) &&
            !isLoading;
  }

  String get usernameErrorText {
    bool showErrorText = submitted && !usernameValidator.isValid(username);
    return showErrorText ? invalidUsernameErrorText : null;
  }

  String get emailErrorText {
    bool showErrorText = submitted && !emailValidator.isValid(email);
    return showErrorText ? invalidEmailErrorText : null;
  }

  String get passwordErrorText {
    bool showErrorText = submitted && !passwordValidator.isValid(password);
    return showErrorText ? invalidPasswordErrorText : null;
  }

  EmailSignInModel copyWith({
    String username,
    String email,
    String password,
    SignInFormType formType,
    bool submitted,
    bool isLoading,
  }) {
    return EmailSignInModel(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      formType: formType ?? this.formType,
      submitted: submitted ?? this.submitted,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
