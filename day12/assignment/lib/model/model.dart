class MenuModel {
  String description;
  String imageUrl;
  String menu;
  int price;

  // MenuModel({
  //   required this.description,
  //   required this.imageUrl,
  //   required this.menu,
  //   required this.price,
  // });
  // @override
  // String toString() =>
  //     "MenuModel (description: $description, imageUrl: $imageUrl, menu: $menu, price: $price)";

  MenuModel.fromMap(Map<String, dynamic> map)
      : description = map['description'],
        imageUrl = map["imageUrl"],
        menu = map["menu"],
        price = map["price"];
}
