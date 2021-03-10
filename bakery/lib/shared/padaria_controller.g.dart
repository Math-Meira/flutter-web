// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'padaria_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PadariaController on _PadariaController, Store {
  final _$currentScreenAtom = Atom(name: '_PadariaController.currentScreen');

  @override
  String get currentScreen {
    _$currentScreenAtom.reportRead();
    return super.currentScreen;
  }

  @override
  set currentScreen(String value) {
    _$currentScreenAtom.reportWrite(value, super.currentScreen, () {
      super.currentScreen = value;
    });
  }

  final _$currentUserAtom = Atom(name: '_PadariaController.currentUser');

  @override
  User get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(User value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  final _$userLoggedInAtom = Atom(name: '_PadariaController.userLoggedIn');

  @override
  bool get userLoggedIn {
    _$userLoggedInAtom.reportRead();
    return super.userLoggedIn;
  }

  @override
  set userLoggedIn(bool value) {
    _$userLoggedInAtom.reportWrite(value, super.userLoggedIn, () {
      super.userLoggedIn = value;
    });
  }

  final _$nameAtom = Atom(name: '_PadariaController.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_PadariaController.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_PadariaController.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$cardapioAtom = Atom(name: '_PadariaController.cardapio');

  @override
  ObservableList<Food> get cardapio {
    _$cardapioAtom.reportRead();
    return super.cardapio;
  }

  @override
  set cardapio(ObservableList<Food> value) {
    _$cardapioAtom.reportWrite(value, super.cardapio, () {
      super.cardapio = value;
    });
  }

  final _$usersAtom = Atom(name: '_PadariaController.users');

  @override
  ObservableList<User> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableList<User> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  final _$_PadariaControllerActionController =
      ActionController(name: '_PadariaController');

  @override
  void setScreen(String newScreen, BuildContext context) {
    final _$actionInfo = _$_PadariaControllerActionController.startAction(
        name: '_PadariaController.setScreen');
    try {
      return super.setScreen(newScreen, context);
    } finally {
      _$_PadariaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass(String pass) {
    final _$actionInfo = _$_PadariaControllerActionController.startAction(
        name: '_PadariaController.setPass');
    try {
      return super.setPass(pass);
    } finally {
      _$_PadariaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String email) {
    final _$actionInfo = _$_PadariaControllerActionController.startAction(
        name: '_PadariaController.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_PadariaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String name) {
    final _$actionInfo = _$_PadariaControllerActionController.startAction(
        name: '_PadariaController.setName');
    try {
      return super.setName(name);
    } finally {
      _$_PadariaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateUserList(List<User> listUser) {
    final _$actionInfo = _$_PadariaControllerActionController.startAction(
        name: '_PadariaController.updateUserList');
    try {
      return super.updateUserList(listUser);
    } finally {
      _$_PadariaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setData(
      {@required List<User> providedUsers,
      @required List<Food> providedCardapio}) {
    final _$actionInfo = _$_PadariaControllerActionController.startAction(
        name: '_PadariaController.setData');
    try {
      return super.setData(
          providedUsers: providedUsers, providedCardapio: providedCardapio);
    } finally {
      _$_PadariaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void login() {
    final _$actionInfo = _$_PadariaControllerActionController.startAction(
        name: '_PadariaController.login');
    try {
      return super.login();
    } finally {
      _$_PadariaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFood(Food food) {
    final _$actionInfo = _$_PadariaControllerActionController.startAction(
        name: '_PadariaController.addFood');
    try {
      return super.addFood(food);
    } finally {
      _$_PadariaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void register() {
    final _$actionInfo = _$_PadariaControllerActionController.startAction(
        name: '_PadariaController.register');
    try {
      return super.register();
    } finally {
      _$_PadariaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentScreen: ${currentScreen},
currentUser: ${currentUser},
userLoggedIn: ${userLoggedIn},
name: ${name},
email: ${email},
password: ${password},
cardapio: ${cardapio},
users: ${users}
    ''';
  }
}
