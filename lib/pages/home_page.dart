import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "Diego Montes";
  String address = "x";

  @override
  void initState() {
    super.initState();
    // getAddress().then((value) {
    //   address = value;
    //   setState(() {});
    // });
    getDataGeneral();
  }

  saveData() async {
    SharedPreferences mandarina = await SharedPreferences.getInstance();
    mandarina.setInt("miNumero", 2000);
    mandarina.setString("miDireccion", "Av. Lima 21323");
    mandarina.getString("miDireccion");
  }

  getDataGeneral() async {
    address = await getAddress();
    setState(() {});
  }

  String getName() {
    return "Daniel";
  }

  Future<String> getAddress() async {
    return Future.delayed(Duration(seconds: 5), () {
      return Future.error("Hubo un error");
    });
  }

  Future<List> getProducts() async {
    return Future.delayed(Duration(seconds: 3), () {
      return ["Frutas", "Verdura", "Ropa", "Zapatos"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getProducts(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            if (snap.hasData) {
              List products = snap.data;
              //return ListView(
              // children: List.generate(
              //     products.length, (index) => Text(products[index])),
              //children: products.map((e) => Text(e)).toList(),
              //);

              // return ListView.builder(
              //   itemCount: products.length,
              //   itemBuilder: (BuildContext context, int index) {
              //     return Text(products[index]);
              //   },
              // );

              return ListView.separated(
                itemCount: products.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return Text("Hola");
                },
              );
            } else if (snap.hasError) {
              return Text(snap.error.toString());
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
