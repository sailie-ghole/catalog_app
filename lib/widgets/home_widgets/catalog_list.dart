import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/pages/home_detail_page.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_image.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index){
        final catalog = CatalogModel.items[index];
        //about MaterialPageRoute to go on HomeDetailPage
         return InkWell(
          onTap: () => Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context)=> HomeDetailPage(
                catalog: catalog
                )
              )
            ),
          child: CatalogItem(catalog: catalog)
          );
      }
      );
  }
}


class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(                                           //Similar to Container
      child: Row(
        children:[
          //Hero Animation
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image
              )
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,              
                  children: [
                    "\₹${catalog.price}".text.bold.xl.make(),
                    ElevatedButton(
                      onPressed: (){}, 
                      child: "Buy".text.make(),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape: MaterialStateProperty.all(StadiumBorder()),
                      ),
                  ),                  ],
                ).pOnly(right: 8.0)
              ],
              )
            )
        ],
      )
    ).white.roundedLg.square(150).make().py16();                              
  }
}