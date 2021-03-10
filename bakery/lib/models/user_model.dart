import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final String email;
  final String password;
  double value;
  String id;
  List<String> cartItems = [];

  User(
      {this.name,
      this.email,
      this.id,
      this.password,
      this.cartItems,
      this.value});

  factory User.fromDoc(DocumentSnapshot doc) {
    List<String> list = [];
    FirebaseFirestore.instance
        .collection("users")
        .doc(doc.id)
        .collection("cart")
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        list.add(element.data()['item']);
      });
    });

    return User(
      name: doc.data()['name'],
      email: doc.data()['email'],
      password: doc.data()['password'],
      id: doc.id,
      cartItems: list,
    );
  }

  void updateUser() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("orders")
        .add({"name": "nomeproduto"});
  }

  void addUser() {
    FirebaseFirestore.instance.collection("users").add(this.toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
      'password': this.password,
    };
  }

  void addItem(String item) {
    cartItems.add(item);
    FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("cart")
        .add({"item": item});
  }

  void clearCart() {
    var collection = FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("cart");
    collection.get().then((value) {
      value.docs.forEach((element) {
        collection.doc(element.id).delete();
      });
    });
  }

  void removeItem(String item) {
    String id = "default";
    if (cartItems.contains(item)) {
      cartItems.remove(item);
      var collection = FirebaseFirestore.instance
          .collection("users")
          .doc(id)
          .collection("cart");
      collection.get().then((value) {
        value.docs.forEach((element) {
          if (element.data()['item'] == item) {
            id = element.id;
          }
        });
      });
      if (id != "default") {
        collection.doc(id).delete();
      }
    }
  }
}

class Food {
  final String name;
  final String number;
  final String description;
  final String id;
  double price;

  Food({this.number, this.price, this.name, this.description, this.id});

  factory Food.fromMap(DocumentSnapshot doc) {
    return Food(
      name: doc.data()['name'],
      price: doc.data()['price'],
      number: doc.data()['number'],
      description: doc.data()['description'],
      id: doc.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'number': this.number,
      'description': this.description,
      'price': this.price,
    };
  }

  void addFood() {
    FirebaseFirestore.instance.collection("cardapio").add(this.toMap());
  }

  void updateFood(double price) {
    this.price = price;
    FirebaseFirestore.instance
        .collection("cardapio")
        .doc(this.id)
        .update(this.toMap());
  }
}
