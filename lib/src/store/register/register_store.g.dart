// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on RegisterPrivate, Store {
  late final _$isLoadingAtom =
      Atom(name: 'RegisterPrivate.isLoading', context: context);

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

  late final _$registersAtom =
      Atom(name: 'RegisterPrivate.registers', context: context);

  @override
  ObservableList<RegisterModel> get registers {
    _$registersAtom.reportRead();
    return super.registers;
  }

  @override
  set registers(ObservableList<RegisterModel> value) {
    _$registersAtom.reportWrite(value, super.registers, () {
      super.registers = value;
    });
  }

  late final _$selectedRegisterAtom =
      Atom(name: 'RegisterPrivate.selectedRegister', context: context);

  @override
  RegisterModel? get selectedRegister {
    _$selectedRegisterAtom.reportRead();
    return super.selectedRegister;
  }

  @override
  set selectedRegister(RegisterModel? value) {
    _$selectedRegisterAtom.reportWrite(value, super.selectedRegister, () {
      super.selectedRegister = value;
    });
  }

  late final _$isEditAtom =
      Atom(name: 'RegisterPrivate.isEdit', context: context);

  @override
  bool get isEdit {
    _$isEditAtom.reportRead();
    return super.isEdit;
  }

  @override
  set isEdit(bool value) {
    _$isEditAtom.reportWrite(value, super.isEdit, () {
      super.isEdit = value;
    });
  }

  late final _$descripcionInputTextFieldControllerAtom = Atom(
      name: 'RegisterPrivate.descripcionInputTextFieldController',
      context: context);

  @override
  TextEditingController get descripcionInputTextFieldController {
    _$descripcionInputTextFieldControllerAtom.reportRead();
    return super.descripcionInputTextFieldController;
  }

  @override
  set descripcionInputTextFieldController(TextEditingController value) {
    _$descripcionInputTextFieldControllerAtom
        .reportWrite(value, super.descripcionInputTextFieldController, () {
      super.descripcionInputTextFieldController = value;
    });
  }

  late final _$valorInputTextFieldControllerAtom = Atom(
      name: 'RegisterPrivate.valorInputTextFieldController', context: context);

  @override
  TextEditingController get valorInputTextFieldController {
    _$valorInputTextFieldControllerAtom.reportRead();
    return super.valorInputTextFieldController;
  }

  @override
  set valorInputTextFieldController(TextEditingController value) {
    _$valorInputTextFieldControllerAtom
        .reportWrite(value, super.valorInputTextFieldController, () {
      super.valorInputTextFieldController = value;
    });
  }

  late final _$fechaInputTextFieldControllerAtom = Atom(
      name: 'RegisterPrivate.fechaInputTextFieldController', context: context);

  @override
  TextEditingController get fechaInputTextFieldController {
    _$fechaInputTextFieldControllerAtom.reportRead();
    return super.fechaInputTextFieldController;
  }

  @override
  set fechaInputTextFieldController(TextEditingController value) {
    _$fechaInputTextFieldControllerAtom
        .reportWrite(value, super.fechaInputTextFieldController, () {
      super.fechaInputTextFieldController = value;
    });
  }

  late final _$comprobarInputTextFieldControllerAtom = Atom(
      name: 'RegisterPrivate.comprobarInputTextFieldController',
      context: context);

  @override
  TextEditingController get comprobarInputTextFieldController {
    _$comprobarInputTextFieldControllerAtom.reportRead();
    return super.comprobarInputTextFieldController;
  }

  @override
  set comprobarInputTextFieldController(TextEditingController value) {
    _$comprobarInputTextFieldControllerAtom
        .reportWrite(value, super.comprobarInputTextFieldController, () {
      super.comprobarInputTextFieldController = value;
    });
  }

  late final _$getRegistersAsyncAction =
      AsyncAction('RegisterPrivate.getRegisters', context: context);

  @override
  Future<void> getRegisters() {
    return _$getRegistersAsyncAction.run(() => super.getRegisters());
  }

  late final _$deleteRegisterAsyncAction =
      AsyncAction('RegisterPrivate.deleteRegister', context: context);

  @override
  Future<void> deleteRegister() {
    return _$deleteRegisterAsyncAction.run(() => super.deleteRegister());
  }

  late final _$addOrUpdateRegisterAsyncAction =
      AsyncAction('RegisterPrivate.addOrUpdateRegister', context: context);

  @override
  Future<void> addOrUpdateRegister() {
    return _$addOrUpdateRegisterAsyncAction
        .run(() => super.addOrUpdateRegister());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
registers: ${registers},
selectedRegister: ${selectedRegister},
isEdit: ${isEdit},
descripcionInputTextFieldController: ${descripcionInputTextFieldController},
valorInputTextFieldController: ${valorInputTextFieldController},
fechaInputTextFieldController: ${fechaInputTextFieldController},
comprobarInputTextFieldController: ${comprobarInputTextFieldController}
    ''';
  }
}
