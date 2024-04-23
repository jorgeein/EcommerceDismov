import 'package:flutter/material.dart';
import 'package:untitled/product_model.dart';


class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(product.title),
            Text(product.title),
            Text('\$${product.price}'),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
