class Model {
  String image;
  int price;
  String name;
  String description;

  Model({
    required this.image,
    required this.price,
    required this.name,
    required this.description,
  });

  Model.fromMap(Map<String, dynamic> map)
      : image = map['image'],
        price = map['price'],
        name = map['name'],
        description = map['description'];

  @override
  String toString() => "데이타 : ( $image  $price   $name   $description  )";

}

// void main() {
//   Model word =
//       Model(image: '이미지', price: 'dd', description: 'asdasd', name: '이름');
//   print(word);
// }
