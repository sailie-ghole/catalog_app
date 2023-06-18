import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  

  final int days = 30;
  final String name = "Sailie";

  @override
  Widget build(BuildContext context) {
   
    final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text("Catalog App", style: TextStyle(color: Colors.black),),
      ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index){
              return ItemWidget(item: dummyList[index]);
            }),
        ),
        drawer: MyDrawer(),
      );
  }
}