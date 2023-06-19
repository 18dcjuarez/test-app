import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:test_app_jun17/src/data/enums/secure_storage_enums.dart';
import 'package:test_app_jun17/src/data/routes/app_routes.dart';
import 'package:test_app_jun17/src/data/services/navigation_service.dart';
import 'package:test_app_jun17/src/data/services/register_service.dart';
import 'package:test_app_jun17/src/models/register_model.dart';
import 'package:test_app_jun17/src/utils/secure_storage_util.dart';

part 'register_store.g.dart';

class RegisterStore = RegisterPrivate with _$RegisterStore;

abstract class RegisterPrivate with Store {
  final registerService = RegisterService();

  @observable
  bool isLoading = false;

  @observable
  ObservableList<RegisterModel> registers = ObservableList<RegisterModel>();

  @observable
  RegisterModel? selectedRegister;

  @observable
  bool isEdit = false;

  @observable
  TextEditingController descripcionInputTextFieldController =
      TextEditingController();

  @observable
  TextEditingController valorInputTextFieldController = TextEditingController();

  @observable
  TextEditingController fechaInputTextFieldController = TextEditingController();

  @observable
  TextEditingController comprobarInputTextFieldController =
      TextEditingController();

  @action
  Future<void> getRegisters() async {
    isLoading = true;
    registers.clear();
    final token =
        await SecureStorageUtil.instance.getData(SecureStorageKey.token);
    final resp = await registerService.getRegisters(body: {
      'consulta': 'pruebas',
      'busquedaBD': 0,
      'idUsuario': 0,
      'token': token
    });
    resp.data.map((r) => registers.add(RegisterModel.fromJson(r))).toList();
    isLoading = false;
  }

  @action
  Future<void> deleteRegister() async {
    isLoading = true;
    final token =
        await SecureStorageUtil.instance.getData(SecureStorageKey.token);
    final resp = await registerService.cudRegister(body: {
      'modo': 'Borrado',
      'id': selectedRegister!.idPrueba,
      'token': token
    });
    if (resp.data['correcto'] == true) {
      getRegisters();
      selectedRegister = null;
      Navigator.pop(
        NavigationService.navigatorKey.currentContext!,
      );
    }
    isLoading = false;
  }

  @action
  Future<void> addOrUpdateRegister() async {
    isLoading = true;
    final token =
        await SecureStorageUtil.instance.getData(SecureStorageKey.token);
    final resp = await registerService.cudRegister(body: {
      'modo': isEdit ? 'Edit' : 'Alta',
      'id': isEdit ? selectedRegister!.idPrueba : 0,
      'descripcion': descripcionInputTextFieldController.text,
      'valor': valorInputTextFieldController.text,
      'fecha': fechaInputTextFieldController.text,
      'comprobar': comprobarInputTextFieldController.text,
      'token': token
    });
    if (resp.data['correcto'] == true) {
      selectedRegister = null;
      Navigator.pushNamedAndRemoveUntil(
          NavigationService.navigatorKey.currentContext!,
          AppRoutes.homePage,
          (Route<dynamic> route) => false);
    }
    isLoading = false;
  }

  void startControllers() {
    descripcionInputTextFieldController.text = selectedRegister!.descripcion!;
    valorInputTextFieldController.text = selectedRegister!.valor!;
    fechaInputTextFieldController.text = selectedRegister!.fecha!;
    comprobarInputTextFieldController.text = selectedRegister!.comprobar!;
  }

  void cleanControllers() {
    descripcionInputTextFieldController.clear();
    valorInputTextFieldController.clear();
    fechaInputTextFieldController.clear();
    comprobarInputTextFieldController.clear();
  }

  void disposeControllers() {
    descripcionInputTextFieldController.dispose();
    valorInputTextFieldController.dispose();
    fechaInputTextFieldController.dispose();
    comprobarInputTextFieldController.dispose();
  }
}
