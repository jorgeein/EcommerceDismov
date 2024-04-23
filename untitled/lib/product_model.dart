class Product {
  final String name;
  final String imageUrl;
  final double price;
  final String description;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
  });
  static Product fromJson(Map<String, dynamic> json) => Product(
    name: json['name'] as String,
    imageUrl: json['imageUrl'] as String,
    price: json['price'] as double,
    description: json['description'] as String,
  );
}
