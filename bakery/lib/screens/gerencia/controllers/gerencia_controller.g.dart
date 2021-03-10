// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gerencia_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GerenciaController on _GerenciaController, Store {
  final _$validUserAtom = Atom(name: '_GerenciaController.validUser');

  @override
  bool get validUser {
    _$validUserAtom.reportRead();
    return super.validUser;
  }

  @override
  set validUser(bool value) {
    _$validUserAtom.reportWrite(value, super.validUser, () {
      super.validUser = value;
    });
  }

  final _$codeAtom = Atom(name: '_GerenciaController.code');

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  final _$_GerenciaControllerActionController =
      ActionController(name: '_GerenciaController');

  @override
  void setCode(String code) {
    final _$actionInfo = _$_GerenciaControllerActionController.startAction(
        name: '_GerenciaController.setCode');
    try {
      return super.setCode(code);
    } finally {
      _$_GerenciaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loginInManager(BuildContext context) {
    final _$actionInfo = _$_GerenciaControllerActionController.startAction(
        name: '_GerenciaController.loginInManager');
    try {
      return super.loginInManager(context);
    } finally {
      _$_GerenciaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
validUser: ${validUser},
code: ${code}
    ''';
  }
}
