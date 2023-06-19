import 'package:mobx/mobx.dart';
import 'package:test_app_jun17/src/data/enums/secure_storage_enums.dart';
import 'package:test_app_jun17/src/data/routes/app_routes.dart';
import 'package:test_app_jun17/src/data/services/login_service.dart';
import 'package:test_app_jun17/src/data/services/navigation_service.dart';
import 'package:test_app_jun17/src/models/login_response_model.dart';
import 'package:test_app_jun17/src/utils/secure_storage_util.dart';
import 'package:test_app_jun17/src/utils/utils.dart';
import 'package:test_app_jun17/src/utils/validators.dart';
import 'package:flutter/material.dart';

part 'login_store.g.dart';

class LoginStore = LoginPrivate with _$LoginStore;

abstract class LoginPrivate with Store {
  final loginService = LoginService();

  @observable
  bool isLoading = false;

  @observable
  TextEditingController userInputTextFieldController = TextEditingController();

  @observable
  TextEditingController passInputTextFieldController = TextEditingController();

  @observable
  bool isFormValid = false;

  @action
  Future<LoginResponseModel> login(
      {required String user, required String password}) async {
    isLoading = true;
    final hashedPass = Utils.passwordHash(password: password);
    final resp = await loginService.login(body: {
      'usuario': user,
      'password': hashedPass,
    });
    if (resp.logged) {
      SecureStorageUtil.instance.saveData(
        SecureStorageKey.token,
        resp.token.toString(),
      );
      SecureStorageUtil.instance.saveData(
        SecureStorageKey.userId,
        resp.idUsuario.toString(),
      );
    }
    isLoading = false;
    return resp;
  }

  @action
  void loginFieldsValidation(String v) {
    isFormValid = Validators.loginValidator(
      user: userInputTextFieldController.text,
      pass: passInputTextFieldController.text,
    );
  }

  @action
  Future<void> logout() async {
    isLoading = true;
    SecureStorageUtil.instance.deleteData(SecureStorageKey.token);
    SecureStorageUtil.instance.deleteData(SecureStorageKey.userId);
    isLoading = false;
    await Navigator.pushNamedAndRemoveUntil(
        NavigationService.navigatorKey.currentContext!,
        AppRoutes.splashPage,
        (route) => false);
  }
}
