import 'dart:ffi';

class Product {
  final String title;
  final String image;
  final int price;
  final String description;

  Product({
    required this.title,
    required this.image,
    required this.price,
    required this.description,
  });
  static Product fromJson(Map<String, dynamic> json) => Product(
    title: json['title'] as String,
    image: json['image'] as String,
    price: json['price'] as int,
    description: json['description'] as String,
  );

}
