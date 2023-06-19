// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on LoginPrivate, Store {
  late final _$isLoadingAtom =
      Atom(name: 'LoginPrivate.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$userInputTextFieldControllerAtom =
      Atom(name: 'LoginPrivate.userInputTextFieldController', context: context);

  @override
  TextEditingController get userInputTextFieldController {
    _$userInputTextFieldControllerAtom.reportRead();
    return super.userInputTextFieldController;
  }

  @override
  set userInputTextFieldController(TextEditingController value) {
    _$userInputTextFieldControllerAtom
        .reportWrite(value, super.userInputTextFieldController, () {
      super.userInputTextFieldController = value;
    });
  }

  late final _$passInputTextFieldControllerAtom =
      Atom(name: 'LoginPrivate.passInputTextFieldController', context: context);

  @override
  TextEditingController get passInputTextFieldController {
    _$passInputTextFieldControllerAtom.reportRead();
    return super.passInputTextFieldController;
  }

  @override
  set passInputTextFieldController(TextEditingController value) {
    _$passInputTextFieldControllerAtom
        .reportWrite(value, super.passInputTextFieldController, () {
      super.passInputTextFieldController = value;
    });
  }

  late final _$isFormValidAtom =
      Atom(name: 'LoginPrivate.isFormValid', context: context);

  @override
  bool get isFormValid {
    _$isFormValidAtom.reportRead();
    return super.isFormValid;
  }

  @override
  set isFormValid(bool value) {
    _$isFormValidAtom.reportWrite(value, super.isFormValid, () {
      super.isFormValid = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('LoginPrivate.login', context: context);

  @override
  Future<LoginResponseModel> login(
      {required String user, required String password}) {
    return _$loginAsyncAction
        .run(() => super.login(user: user, password: password));
  }

  late final _$logoutAsyncAction =
      AsyncAction('LoginPrivate.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$LoginPrivateActionController =
      ActionController(name: 'LoginPrivate', context: context);

  @override
  void loginFieldsValidation(String v) {
    final _$actionInfo = _$LoginPrivateActionController.startAction(
        name: 'LoginPrivate.loginFieldsValidation');
    try {
      return super.loginFieldsValidation(v);
    } finally {
      _$LoginPrivateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
userInputTextFieldController: ${userInputTextFieldController},
passInputTextFieldController: ${passInputTextFieldController},
isFormValid: ${isFormValid}
    ''';
  }
}
