import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutterblog/app/sign_in/sign_in_model.dart';
import 'package:flutterblog/services/app_user.dart';
import 'package:flutterblog/services/auth.dart';

class SignInBloc {
  final AuthBase auth;

  SignInBloc({@required this.auth});

  final StreamController<SignInModel> _modelController =
      StreamController<SignInModel>();

  Stream<SignInModel> get modelStream => _modelController.stream;

  SignInModel _model = SignInModel();

  void dispose() {
    _modelController.close();
  }

  Future<AppUser> _signIn(Future<AppUser> Function() signInMethod) async {
    try {
      updateWith(isLoading: true);
      return await signInMethod();
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }

  Future<AppUser> signInWithGoogle() async =>
      await _signIn(auth.signInWithGoogle);

  Future<AppUser> signInWithFacebook() async =>
      await _signIn(auth.signInWithFacebook);

  Future<void> submit() async {
    updateWith(submitted: true, isLoading: true);
    try {
      if (_model.formType == SignInFormType.logIn) {
        await auth.signInWithEmailAndPassword(_model.email, _model.password);
      } else {
        await auth.createUserWithEmailAndPassword(
            _model.email, _model.password);
      }
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }

  void toggleFormType() {
    final formType = _model.formType == SignInFormType.logIn
        ? SignInFormType.register
        : SignInFormType.logIn;
    updateWith(
      email: '',
      password: '',
      formType: formType,
      submitted: false,
      isLoading: false,
    );
  }

  void updateEmail(String email) => updateWith(email: email);

  void updatePassword(String password) => updateWith(password: password);

  void updateWith({
    String email,
    String password,
    SignInFormType formType,
    bool submitted,
    bool isLoading,
  }) {
    //  update the model
    _model = _model.copyWith(
      email: email,
      password: password,
      formType: formType,
      submitted: submitted,
      isLoading: isLoading,
    );
    //  Add the updated model to _modelController
    _modelController.add(_model);
  }
}
