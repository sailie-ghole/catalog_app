import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';


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
   
    //final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text("Catalog App", style: TextStyle(color: Colors.black),),
      ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
          ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  ),                
                itemBuilder: (context, index){
                  final item = CatalogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: GridTile(
                      header: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          
                        ),
                        child: Text(item.name)
                        ),
                  
                      child: Image.network(item.image),
                      footer: Text(
                        item.price.toString(),
                      )
                      ),
                  );
                },
                itemCount: CatalogModel.items.length,
                )
          :Center(
            child: CircularProgressIndicator()),
        ),
        drawer: MyDrawer(),
      );
  }
}