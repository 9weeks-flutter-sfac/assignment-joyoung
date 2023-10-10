class MenuModel {
  String description;
  String imageUrl;
  String menu;
  String price;

  MenuModel({
    required this.description,
    required this.imageUrl,
    required this.menu,
    required this.price,
  });
  @override
  String toString() => "MenuModel ($description  / $imageUrl / $menu  / $price  ) }";

  MenuModel.fromMap(Map<String, dynamic> map)
      : description = map['description'],
        imageUrl = map["imageUrl"],
        menu = map["menu"],
        price = map["price"];
}

void main() {
  Map<String, dynamic> networkData = {
    "description": "description",
    "imageUrl": "imageUrl",
    "menu": "description",
    "price": "description",
  };

  var a = MenuModel.fromMap(networkData);
  print(a);
}
