import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_header.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_list.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final String name = "Sailie";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson = 
            await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
          .map<Item>((item) => Item.fromMap(item))  
          .toList();
          setState(() {
            
          });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: Vx.m32,           
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                 CatalogList().expand().py16()
              else
                 CircularProgressIndicator().centered().expand(), 
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

