import 'package:bakery/shared/padaria_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../colors.dart';

Cores cores = Cores();

Widget webBar(PadariaController padariaController, BuildContext context) {
  return Positioned(
    top: 0,
    left: 0,
    right: 0,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            child: Text(
              "Padaria Sabor ou Sonho",
              style: TextStyle(
                  fontSize: 36, color: cores.caramel, fontFamily: "PatuaOne"),
            ),
          ),
          Spacer(),
          (MediaQuery.of(context).size.width / 2) > 420
              ? Row(
                  children: [
                    menuTab("Home",
                        padariaController: padariaController, context: context),
                    menuTab("Cardápio",
                        padariaController: padariaController, context: context),
                    menuTab("Carrinho",
                        padariaController: padariaController, context: context),
                    menuTab("Gerência",
                        padariaController: padariaController, context: context),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                )
              : Container(
                  child: Observer(
                    builder: (_) {
                      return PopupMenuButton(
                        onSelected: (value) {
                          padariaController.setScreen(value, context);
                        },
                        icon: Icon(
                          Icons.menu,
                          color: cores.bread,
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          PopupMenuItem(
                            value: "Home",
                            child: Text(
                              "Home",
                              style: TextStyle(
                                  color:
                                      padariaController.currentScreen == "Home"
                                          ? cores.bread
                                          : cores.cream,
                                  fontSize: 20,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          PopupMenuItem(
                            value: "Cardápio",
                            child: Text(
                              "Cardápio",
                              style: TextStyle(
                                  color: padariaController.currentScreen ==
                                          "Cardápio"
                                      ? cores.bread
                                      : cores.cream,
                                  fontSize: 20,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          PopupMenuItem(
                            value: "Carrinho",
                            child: Text(
                              "Carrinho",
                              style: TextStyle(
                                  color: padariaController.currentScreen ==
                                          "Carrinho"
                                      ? cores.bread
                                      : cores.cream,
                                  fontSize: 20,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          PopupMenuItem(
                            value: "Gerência",
                            child: Text(
                              "Gerência",
                              style: TextStyle(
                                  color: padariaController.currentScreen ==
                                          "Gerência"
                                      ? cores.bread
                                      : cores.cream,
                                  fontSize: 20,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
        ],
      ),
    ),
  );
}

Widget menuTab(String title,
    {PadariaController padariaController, BuildContext context}) {
  return Observer(
    builder: (_) {
      return InkWell(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            title,
            style: TextStyle(
                color: padariaController.currentScreen == title
                    ? cores.bread
                    : cores.cream,
                fontSize: 24,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w700),
          ),
        ),
        onTap: () {
          padariaController.setScreen(title, context);
        },
      );
    },
  );
}
