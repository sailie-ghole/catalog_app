import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,              
                    children: [
                      "\₹${catalog.price}".text.bold.xl4.red800.make(),
                      ElevatedButton(
                        onPressed: (){}, 
                        child: "Buy".text.make(),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                          shape: MaterialStateProperty.all(StadiumBorder()),
                        ),
                      ).wh(100, 50),                  
                    ],
                  ).p32(),
      ),
      body: SafeArea(
        bottom: false,      //to remove safearea from bottom
        child: Column(
          children: [
            //hERO Amination
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(
                catalog.image
                )
              ).h32(context),
              Expanded(
                //Use of VxArc
                child: VxArc(
                  arcType: VxArcType.convey,
                  height: 30.0,
                  edge: VxEdge.top,
                  child: Container(
                    width: context.screenWidth,
                    color: Colors.white,
                    child: Column(
                      children: [
                        catalog.name.text.xl4.color(MyTheme.darkBluishColor).bold.make(),
                        catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                        10.heightBox,
                        
                      ],
                    ).py64(),
                  ),
                ),
              ),
          ],
          ),
      )
    );
     
  }
}