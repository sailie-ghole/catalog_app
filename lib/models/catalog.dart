class Item{
  final num id;
  final String name;
  final String desc;
  final num price;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.image});
}

class CatalogModel{
static final items = [
  Item(
      id: 1,
      name: "Lipstick",
      desc:"M.A.C Long Lasting Matte Lipstick",
      price: 2200,
      image:
        "https://images-static.nykaa.com/media/catalog/product/b/f/bf74db7MACXX00000047_a0.jpg",)
        
   ];
}