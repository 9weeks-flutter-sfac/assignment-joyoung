import 'package:dio/dio.dart';

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

  Future<Model> networkData() async {
    var res = await Dio().get('https://sniperfactory.com/sfac/http_json_data');
    if (res.statusCode == 200) {
      return Model.fromMap(res.data['item']);
    }
    ;
    return Model(image: '', price: 0, name: '', description: '');
  }
}

void main() async {
  Model data =
      Model(image: 'image', price: 1, name: '', description: 'description');
  Model result = await data.networkData();
  print(result.toString());
}
