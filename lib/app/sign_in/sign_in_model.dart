import 'package:flutterblog/app/sign_in/validators.dart';

enum SignInFormType { logIn, register }

class SignInModel with UsernameEmailAndPasswordValidators {
  SignInModel({
    this.email = '',
    this.password = '',
    this.formType = SignInFormType.logIn,
    this.submitted = false,
    this.isLoading = false,
  });

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

  bool get showRegisterForm {
    return formType == SignInFormType.logIn ? false : true;
  }

  bool get canSubmit {
    return emailValidator.isValid(email) &&
        passwordValidator.isValid(password) &&
        !isLoading;
  }

  String get emailErrorText {
    bool showErrorText = submitted && !emailValidator.isValid(email);
    return showErrorText ? invalidEmailErrorText : null;
  }

  String get passwordErrorText {
    bool showErrorText = submitted && !passwordValidator.isValid(password);
    return showErrorText ? invalidPasswordErrorText : null;
  }

  SignInModel copyWith({
    String email,
    String password,
    SignInFormType formType,
    bool submitted,
    bool isLoading,
  }) {
    return SignInModel(
      email: email ?? this.email,
      password: password ?? this.password,
      formType: formType ?? this.formType,
      submitted: submitted ?? this.submitted,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
