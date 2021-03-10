import 'package:bakery/models/user_model.dart';
import 'package:bakery/screens/home/home_screen.dart';
import 'package:bakery/screens/login/components.dart';
import 'package:bakery/shared/colors.dart';
import 'package:bakery/shared/padaria_controller.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final Cores cores = Cores();

  final PadariaController padariaController;
  RegisterScreen(this.padariaController);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: padariaController == null
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
                                "Cadastrar",
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
                              hint: "nome",
                              type: "name",
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
                              hint: "email",
                              type: "email",
                              textColor: Colors.white,
                              hintColor: cores.savanaGreen,
                              backColor: cores.nude,
                              obscure: false,
                              width: 400,
                              prefix: Icon(
                                Icons.mail_outline_rounded,
                                color: Colors.white,
                              ),
                            ),
                            formField(
                              padariaController: padariaController,
                              hint: "Senha",
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
                              text: "Cadastre-se",
                              onTap: () {
                                padariaController.register();
                                if (padariaController.userLoggedIn) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreen(padariaController)));
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red[700],
                                      content: Text(
                                        "Usuário já existe ou os campos estão vazios, revise os parâmetros...",
                                        style: TextStyle(
                                            color: Colors.white, fontFamily: "Roboto"),
                                      ),
                                    ),
                                  );
                                }
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
            ),
    );
  }
}
