import 'package:bakery/models/user_model.dart';
import 'package:bakery/screens/cardapio/cardapio_screen.dart';
import 'package:bakery/screens/gerencia/gerencia_screen.dart';
import 'package:bakery/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'padaria_controller.g.dart';

class PadariaController = _PadariaController with _$PadariaController;

abstract class _PadariaController with Store {
  @observable
  String currentScreen = "Home";

  @observable
  User currentUser;

  @observable
  bool userLoggedIn = false;

  @observable
  String name = "";

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  ObservableList<Food> cardapio = ObservableList<Food>.of([]);

  @observable
  ObservableList<User> users = ObservableList<User>.of([]);

  @action
  void setScreen(String newScreen, BuildContext context) {
    String oldScreen = currentScreen;
    currentScreen = newScreen;
    switch (currentScreen) {
      case "Home":
        if (oldScreen != "Home") {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen(this)));
        }
        break;
      case "Cardápio":
        if (oldScreen != "Cardápio") {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => CardapioScreen(this)));
        }
        break;
      case "Carrinho":
        print(currentScreen);
        break;
      case "Gerência":
        if (oldScreen != "Gerência") {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => GerenciaScreen(this)));
        }
        break;
    }
  }

  Food getId(String code) {
    for (Food food in cardapio) {
      if (food.number == code) {
        return food;
      }
    }
    return null;
  }

  @action
  void setPass(String pass) {
    this.password = pass;
  }

  @action
  void setEmail(String email) {
    this.email = email;
  }

  @action
  void setName(String name) {
    this.name = name;
  }

  @action
  void updateUserList(List<User> listUser) {
    for (User user in listUser) {
      for (User u in users) {
        if (u.email != user.email) {
          users.add(user);
        }
        if (currentUser.email == user.email &&
            currentUser.password == user.password) {
          currentUser = user;
        }
      }
    }
  }


  @action
  void setData(
      {@required List<User> providedUsers,
      @required List<Food> providedCardapio}) {

    cardapio = ObservableList<Food>.of([]);
    users = ObservableList<User>.of([]);
    cardapio = ObservableList<Food>.of(providedCardapio);
    users = ObservableList<User>.of(providedUsers);

    cardapio.sort((a, b) => a.number.compareTo(b.number));
  }

  @action
  void login() {
    bool log = false;
    for (User user in users) {
      if (user.email == email && user.password == password) {
        currentUser = user;
        log = true;
      }
    }
    if (!log) {
      password = "";
      email = "";
    }
    userLoggedIn = log;
  }

  @action
  void addFood(Food food) {
    this.currentUser.addItem(food.name);
  }

  @action
  void register() {
    bool valUser;
    if (this.email != "" &&
        this.name != "" &&
        this.password != "" &&
        this.email != null &&
        this.name != null &&
        this.password != null) {
      valUser = true;
      for (User user in users) {
        if (user.email == email) {
          valUser = false;
        }
      }
      if (valUser) {
        currentUser = User(email: email, name: name, password: password);
        currentUser.addUser();
      }
      userLoggedIn = valUser;
    } else {
      userLoggedIn = false;
    }
  }
}
