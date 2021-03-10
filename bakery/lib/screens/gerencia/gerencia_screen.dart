import 'package:bakery/screens/gerencia/components.dart';
import 'package:bakery/screens/gerencia/controllers/gerencia_controller.dart';
import 'package:bakery/shared/colors.dart';
import 'package:bakery/shared/components/widgets.dart';
import 'package:bakery/shared/padaria_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class GerenciaScreen extends StatelessWidget {
  final PadariaController padariaController;
  final GerenciaController gerenciaController = GerenciaController();
  final Cores cores = Cores();

  GerenciaScreen(this.padariaController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Observer(
            builder: (_) {
              return gerenciaController.validUser
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: cores.savanaGreen,
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
                                  "Opções",
                                  style: TextStyle(
                                      fontFamily: "PatuaOne",
                                      fontSize: 32,
                                      color: cores.savanaGreen,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Spacer(),
                              buttonFormGerencia(
                                  textColor: Colors.white,
                                  backColor: cores.caramel,
                                  text: "Adicionar item ao cardápio",
                                  width: 400,
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return dialogAddItem(context);
                                        });
                                  }),
                              buttonFormGerencia(
                                  textColor: Colors.white,
                                  backColor: cores.caramel,
                                  text: "Definir promoção",
                                  width: 400,
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return dialogPromotion(
                                              context, padariaController);
                                        });
                                  }),
                              buttonFormGerencia(
                                  textColor: Colors.white,
                                  backColor: cores.caramel,
                                  text: "Consultar usuário",
                                  width: 400,
                                  onTap: () {}),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: cores.savanaGreen,
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
                                  "Área de Gerência",
                                  style: TextStyle(
                                      fontFamily: "PatuaOne",
                                      fontSize: 32,
                                      color: cores.savanaGreen,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Spacer(),
                              labelTexts(
                                  "Nome:", padariaController.currentUser.name),
                              labelTexts("Email: ",
                                  padariaController.currentUser.email),
                              Spacer(),
                              dataRow(),
                              Spacer(),
                              formFieldGerencia(
                                hint: "Código do funcionário",
                                prefix: Icon(
                                  Icons.account_box,
                                  color: Colors.white,
                                ),
                                backColor: cores.nude,
                                textColor: Colors.white,
                                hintColor: cores.savanaGreen,
                                gerenciaController: gerenciaController,
                                width: 400,
                              ),
                              buttonFormGerencia(
                                  backColor: cores.caramel,
                                  textColor: Colors.white,
                                  text: "Acessar",
                                  width: 400,
                                  onTap: () {
                                    gerenciaController.loginInManager(context);
                                  }),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    );
            },
          ),
          webBar(padariaController, context),
        ],
      ),
    );
  }
}
