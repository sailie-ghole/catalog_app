import 'package:catalog_app/widgets/drawer.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  

  final int days = 30;
  final String name = "Sailie";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Catalog App"),
      ),
        body: Center(
          child: Container(
            child: Text("Welcome to Learning Flutter $days : $name"),
            ),
        ),
        drawer: MyDrawer(),
      );
  }
}