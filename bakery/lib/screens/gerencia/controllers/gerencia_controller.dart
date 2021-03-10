import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'gerencia_controller.g.dart';

class GerenciaController = _GerenciaController with _$GerenciaController;

abstract class _GerenciaController with Store {
  @observable
  bool validUser = false;

  @observable
  String code = "";

  @action
  void setCode(String code) {
    this.code = code;
  }

  @action
  void loginInManager(BuildContext context) {
    if (this.code == "gerencia123") {
      //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>));
      validUser = true;
    }
  }
}
