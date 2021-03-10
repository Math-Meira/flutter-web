import 'package:bakery/models/user_model.dart';
import 'package:bakery/shared/colors.dart';
import 'package:bakery/shared/padaria_controller.dart';
import 'package:flutter/material.dart';

List<Widget> listTileFood(
    PadariaController padariaController, BuildContext context) {
  List<Widget> list = [];
  double width = MediaQuery.of(context).size.width;
  double size = width < 1000 ? width : 1000;
  padariaController.cardapio.forEach((food) {
    list.add(
      InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return dialogAddFood(context, padariaController, food);
              });
        },
        child: foodTile(food, size),
      ),
    );
  });

  return list;
}

Widget foodTile(Food food, double width) {
  Cores cores = Cores();
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
    height: 100,
    width: width,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: cores.deepGreen.withOpacity(0.6),
          offset: Offset(0.0, 4.0), //(x,y)
          blurRadius: 4.0,
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          food.number,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontFamily: "PatuaOne",
            color: cores.bread,
          ),
        ),
        SizedBox(width: 16),
        Container(
          width: 2,
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0),
                  cores.cream,
                  cores.cream,
                  cores.cream.withOpacity(0),
                ]),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                  color: cores.caramel,
                ),
              ),
              Text(
                food.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w300,
                  color: cores.deepGreen,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 32),
        Text(
          "R\$" + food.price.toStringAsFixed(2),
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 32,
            fontFamily: "PatuaOne",
            color: cores.savanaGreen,
          ),
        ),
      ],
    ),
  );
}

Widget dialogAddFood(
    BuildContext context, PadariaController padariaController, Food food) {
  Cores cores = Cores();
  return Material(
    type: MaterialType.transparency,
    child: Center(
      child: Container(
        height: 360,
        width: 480,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Adicionar ao Carrinho",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "PatuaOne",
                        fontSize: 32,
                        color: cores.bread,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            food.name,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 24,
                                color: cores.deepGreen,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Text(
                          "R\$" + food.price.toStringAsFixed(2),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 24,
                              color: cores.deepGreen,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  buttonFormCardapio(
                      backColor: cores.caramel,
                      textColor: Colors.white,
                      text: "Adicionar",
                      onTap: () {
                        padariaController.addFood(food);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green[700],
                            content: Text(
                              "Item adicionado ao carrinho com sucesso",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: "Roboto"),
                            ),
                          ),
                        );
                      }),
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

Widget buttonFormCardapio(
    {Color backColor, Color textColor, String text, Function onTap}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
    child: InkWell(
      onTap: onTap,
      child: Container(
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
