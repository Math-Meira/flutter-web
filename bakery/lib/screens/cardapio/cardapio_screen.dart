import 'package:bakery/models/user_model.dart';
import 'package:bakery/screens/cardapio/components.dart';
import 'package:bakery/shared/colors.dart';
import 'package:bakery/shared/components/widgets.dart';
import 'package:bakery/shared/padaria_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CardapioScreen extends StatelessWidget {
  final Cores cores = Cores();
  final PadariaController padariaController;

  CardapioScreen(this.padariaController);

  @override
  Widget build(BuildContext context) {
    final List<Food> cardapio = Provider.of<List<Food>>(context);
    final List<User> users = Provider.of<List<User>>(context);

    padariaController.setData(providedUsers: users, providedCardapio: cardapio);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: cores.cream,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset("assets/images/pao.jpg", fit: BoxFit.cover),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    cores.caramel.withOpacity(0.1),
                    cores.bread.withOpacity(0.6),
                  ]),
            ),
          ),
          Observer(
            builder: (_) {
              return padariaController.cardapio.isEmpty
                  ? Container(
                      color: cores.caramel,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.only(top: 72),
                      child: Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: listTileFood(padariaController, context),
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
