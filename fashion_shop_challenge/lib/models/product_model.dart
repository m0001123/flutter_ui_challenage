import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  String id;
  String name;
  int price;
  bool isfavorite;
  List<String> imglist;
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imglist,
    required this.isfavorite,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'isfavorite': isfavorite,
      'imglist': imglist,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        id: map['id'] as String,
        name: map['name'] as String,
        price: map['price'] as int,
        isfavorite:
            (map['isfavorite'] != null) ? map['isfavorite'] as bool : false,
        imglist: List<String>.from(
          (map['imglist'] as List),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
