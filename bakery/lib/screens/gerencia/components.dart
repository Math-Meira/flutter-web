import 'package:bakery/models/user_model.dart';
import 'package:bakery/screens/gerencia/controllers/gerencia_controller.dart';
import 'package:bakery/shared/colors.dart';
import 'package:bakery/shared/padaria_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget dialogAddItem(BuildContext context) {
  String name, description, number;
  double price;
  Cores cores = Cores();

  return Material(
    type: MaterialType.transparency,
    child: Center(
      child: Container(
        height: 480,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            btnSair(context),
            Container(
              margin: EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Novo item",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "PatuaOne",
                        fontSize: 32,
                        color: cores.bread,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  genericField(
                    prefix: Icon(
                      Icons.emoji_food_beverage_rounded,
                      color: Colors.white,
                    ),
                    hint: "Nome do produto",
                    func: (valor) {
                      name = valor;
                    },
                    textColor: Colors.white,
                    backColor: cores.nude,
                    hintColor: cores.savanaGreen,
                    width: 400,
                  ),
                  genericField(
                    prefix: Icon(
                      Icons.attach_money,
                      color: Colors.white,
                    ),
                    hint: "Preço",
                    func: (valor) {
                      double.tryParse(valor) != null
                          ? price = double.tryParse(valor)
                          : price = null;
                    },
                    textColor: Colors.white,
                    backColor: cores.nude,
                    hintColor: cores.savanaGreen,
                    width: 400,
                  ),
                  genericField(
                    prefix: Icon(
                      Icons.description,
                      color: Colors.white,
                    ),
                    hint: "Descrição",
                    func: (valor) {
                      description = valor;
                    },
                    textColor: Colors.white,
                    backColor: cores.nude,
                    hintColor: cores.savanaGreen,
                    width: 400,
                  ),
                  genericField(
                    prefix: Icon(
                      Icons.tag,
                      color: Colors.white,
                    ),
                    hint: "Código do produto",
                    func: (valor) {
                      number = valor;
                    },
                    textColor: Colors.white,
                    backColor: cores.nude,
                    hintColor: cores.savanaGreen,
                    width: 400,
                  ),
                  Spacer(),
                  buttonFormGerencia(
                    textColor: Colors.white,
                    backColor: cores.caramel,
                    text: "Adicionar",
                    width: 400,
                    onTap: () {
                      if (name != null &&
                          name != "" &&
                          description != null &&
                          description != "" &&
                          number != null &&
                          number != "" &&
                          price != null &&
                          price != 0.0) {
                        Food food = Food(
                            name: name,
                            number: number,
                            price: price,
                            description: description);
                        food.addFood();
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green[700],
                            content: Text(
                              "Produto adicionado com sucesso...",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: "Roboto"),
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.redAccent[700],
                            content: Text(
                              "Revise os parâmetros, algo está faltando...",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: "Roboto"),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget dialogPromotion(
    BuildContext context, PadariaController padariaController) {
  String number;
  double price;
  Cores cores = Cores();

  return Material(
    type: MaterialType.transparency,
    child: Center(
      child: Container(
        height: 480,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            btnSair(context),
            Container(
              margin: EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Definir Promoção",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "PatuaOne",
                        fontSize: 32,
                        color: cores.bread,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  genericField(
                    prefix: Icon(
                      Icons.emoji_food_beverage_rounded,
                      color: Colors.white,
                    ),
                    hint: "Código do produto",
                    func: (valor) {
                      number = valor;
                    },
                    textColor: Colors.white,
                    backColor: cores.nude,
                    hintColor: cores.savanaGreen,
                    width: 400,
                  ),
                  genericField(
                    prefix: Icon(
                      Icons.attach_money,
                      color: Colors.white,
                    ),
                    hint: "Preço",
                    func: (valor) {
                      double.tryParse(valor) != null
                          ? price = double.tryParse(valor)
                          : price = null;
                    },
                    textColor: Colors.white,
                    backColor: cores.nude,
                    hintColor: cores.savanaGreen,
                    width: 400,
                  ),
                  Spacer(),
                  buttonFormGerencia(
                    textColor: Colors.white,
                    backColor: cores.caramel,
                    text: "Atualizar item",
                    width: 400,
                    onTap: () {
                      if (number != null &&
                          number != "" &&
                          price != null &&
                          price != 0.0) {
                        if (padariaController.getId(number) != null) {
                          padariaController.getId(number).updateFood(price);

                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green[700],
                              content: Text(
                                "Produto atualizado com sucesso...",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: "Roboto"),
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.redAccent[700],
                              content: Text(
                                "O código do produto está incorreto...",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: "Roboto"),
                              ),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.redAccent[700],
                            content: Text(
                              "Revise os parâmetros, algo está errado...",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: "Roboto"),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget btnSair(BuildContext context) {
  return Positioned(
    top: -16,
    right: -16,
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color: Cores().caramel,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Icon(
          Icons.clear,
          color: Colors.white,
          size: 20,
        ),
      ),
    ),
  );
}

Widget labelTexts(String title, String atribute) {
  Cores cores = Cores();
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: cores.nude,
    ),
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 20),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text(
            atribute,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.w300,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget formFieldGerencia(
    {String hint,
    Icon prefix,
    Color textColor,
    Color hintColor,
    Color backColor,
    GerenciaController gerenciaController,
    double width}) {
  return Container(
    width: width,
    margin: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: backColor,
    ),
    child: TextFormField(
      onChanged: (code) {
        gerenciaController.setCode(code);
      },
      style: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16),
        prefixIcon: Container(
          margin: EdgeInsets.only(left: 12, right: 8),
          child: prefix,
        ),
        hintText: hint,
        hoverColor: textColor,
        hintStyle: TextStyle(
          fontFamily: "Roboto",
          color: hintColor,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Widget genericField({
  String hint,
  Icon prefix,
  Color textColor,
  Color hintColor,
  Color backColor,
  void func(String str),
  double width,
  TextEditingController textController,
}) {
  return Container(
    width: width,
    margin: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: backColor,
    ),
    child: TextFormField(
      controller: textController,
      onChanged: func,
      style: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16),
        prefixIcon: Container(
          margin: EdgeInsets.only(left: 12, right: 8),
          child: prefix,
        ),
        hintText: hint,
        hoverColor: textColor,
        hintStyle: TextStyle(
          fontFamily: "Roboto",
          color: hintColor,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Widget buttonFormGerencia(
    {Color backColor,
    Color textColor,
    String text,
    double width,
    Function onTap}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
    child: InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        alignment: Alignment.center,
        height: 48,
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400],
              offset: Offset(0.0, 2.0), //(x,y)
              blurRadius: 2.0,
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "Roboto",
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  );
}

Widget dataRow() {
  Cores cores = Cores();
  return Row(
    children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  cores.cream,
                  cores.nude,
                ]),
          ),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          height: 2,
        ),
      ),
      Text(
        "informe os dados",
        style: TextStyle(
          color: cores.nude,
          fontSize: 20,
          fontFamily: "PatuaOne",
          fontWeight: FontWeight.w500,
        ),
      ),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  cores.cream,
                  cores.nude,
                ]),
          ),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          height: 2,
        ),
      ),
    ],
  );
}
