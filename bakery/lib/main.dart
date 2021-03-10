import 'package:bakery/screens/login/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        return CircularProgressIndicator();
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Food> listFood = [];
    /*FirebaseFirestore.instance
        .collection('cardapio')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        listFood.add(Food.fromMap(element));
      });
    });*/

    FirebaseFirestore.instance
        .collection('cardapio')
        .snapshots()
        .listen((event) {
      event.docChanges.forEach((element) {
        if (element.type == DocumentChangeType.added) {
          listFood.add(Food.fromMap(element.doc));
        } else if (element.type == DocumentChangeType.modified) {
          Food rem;
          listFood.forEach((food) {
            if (food.number == element.doc.data()['number']) {
              rem = food;
            }
          });
          listFood.remove(rem);
          listFood.add(Food.fromMap(element.doc));
        } else if (element.type == DocumentChangeType.removed) {
          Food rem;
          listFood.forEach((food) {
            if (food.number == element.doc.data()['number']) {
              rem = food;
            }
          });
          listFood.remove(rem);
        }
      });
    });

    List<User> listUser = [];
    FirebaseFirestore.instance.collection('users').snapshots().listen((event) {
      event.docChanges.forEach((element) {
        if (element.type == DocumentChangeType.added) {
          listUser.add(User.fromDoc(element.doc));
        } else if (element.type == DocumentChangeType.modified) {
          User rem;
          listUser.forEach((user) {
            if (user.email == element.doc.data()['email']) {
              rem = user;
            }
          });
          listUser.remove(rem);
          listUser.add(User.fromDoc(element.doc));
        } else if (element.type == DocumentChangeType.removed) {
          User rem;
          listUser.forEach((user) {
            if (user.email == element.doc.data()['email']) {
              rem = user;
            }
          });
          listUser.remove(rem);
        }
      });
    });

    return MultiProvider(
      providers: [
        Provider<List<Food>>(
          create: (_) => listFood,
        ),
        Provider<List<User>>(
          create: (_) => listUser,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}

/*final usersCollection = FirebaseFirestore.instance.collection('users');
    final usersStream = usersCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => User.fromDoc(doc)).toList();
    });
     final cardapioCollection =
        FirebaseFirestore.instance.collection('cardapio');
    final cardapioStream = cardapioCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Food.fromMap(doc)).toList();
    });*/
