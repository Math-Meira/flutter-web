import 'package:bakery/models/user_model.dart';
import 'package:bakery/shared/colors.dart';
import 'package:bakery/shared/components/widgets.dart';
import 'package:bakery/shared/padaria_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final cores = Cores();
  final PadariaController padariaController;

  HomeScreen(this.padariaController);

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<User>>(context);

    Future.delayed(Duration(seconds: 4)).then((_) {
      padariaController.updateUserList(users);
    });

    return Scaffold(
      body: Observer(
        builder: (_) {
          return padariaController == null ||
                  padariaController.currentUser.id == null
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
                      color: cores.bread,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset("assets/images/cafe_da_manha.jpg",
                          fit: BoxFit.cover),
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
                              cores.caramel.withOpacity(0.6),
                            ]),
                      ),
                    ),
                    webBar(padariaController, context),
                  ],
                );
        },
      ),
    );
  }
}
