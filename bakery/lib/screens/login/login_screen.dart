import 'package:bakery/models/user_model.dart';
import 'package:bakery/screens/home/home_screen.dart';
import 'package:bakery/screens/login/register_screen.dart';
import 'package:bakery/shared/colors.dart';
import 'package:bakery/shared/padaria_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'components.dart';

class LoginScreen extends StatelessWidget {
  final cores = Cores();

  final padariaController = PadariaController();

  @override
  Widget build(BuildContext context) {
    List<Food> cardapio = Provider.of<List<Food>>(context);
    List<User> users = Provider.of<List<User>>(context);

    Future.delayed(Duration(seconds: 2)).then((_) {
      padariaController.setData(
          providedCardapio: cardapio, providedUsers: users);
    });

    return Scaffold(
      body: Observer(
        builder: (_) {
          return padariaController.users.isEmpty
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: cores.savanaGreen,
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(cores.caramel),
                    ),
                  ),
                )
              : Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: cores.savanaGreen,
                    ),
                    Center(
                      child: Container(
                        child: Center(
                          child: Container(
                            height: 400,
                            width: 400,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: cores.cream,
                              boxShadow: [
                                BoxShadow(
                                  color: cores.deepGreen,
                                  offset: Offset(0.0, 4.0), //(x,y)
                                  blurRadius: 4.0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(16),
                                  child: Text(
                                    "Fazer Logon",
                                    style: TextStyle(
                                        fontFamily: "PatuaOne",
                                        fontSize: 32,
                                        color: cores.savanaGreen,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Spacer(),
                                formField(
                                  padariaController: padariaController,
                                  hint: "example@email.com",
                                  type: "email",
                                  textColor: Colors.white,
                                  hintColor: cores.savanaGreen,
                                  backColor: cores.nude,
                                  obscure: false,
                                  width: 400,
                                  prefix: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                ),
                                formField(
                                  padariaController: padariaController,
                                  hint: "********",
                                  type: "pass",
                                  textColor: Colors.white,
                                  backColor: cores.nude,
                                  hintColor: cores.savanaGreen,
                                  obscure: true,
                                  width: 400,
                                  prefix: Icon(
                                    Icons.lock_outline,
                                    color: Colors.white,
                                  ),
                                ),
                                Spacer(),
                                buttonForm(
                                  backColor: cores.caramel,
                                  textColor: Colors.white,
                                  width: 400,
                                  text: "Entre",
                                  onTap: () {
                                    padariaController.login();
                                    if (padariaController.userLoggedIn) {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) => HomeScreen(
                                                  padariaController)));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.red[700],
                                          content: Text(
                                            "Usuário inválido, revise os parâmetros...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Roboto"),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                                orRow(),
                                buttonForm(
                                  backColor: Colors.white,
                                  textColor: cores.caramel,
                                  width: 400,
                                  text: "Cadastre-se",
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterScreen(
                                                    padariaController)));
                                  },
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
