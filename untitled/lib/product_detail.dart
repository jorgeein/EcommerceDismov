import 'package:flutter/material.dart';
import 'package:untitled/product_model.dart';


class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(product.imageUrl),
            Text(product.name),
            Text('\$${product.price}'),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
