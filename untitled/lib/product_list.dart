import 'package:flutter/material.dart';
import 'package:untitled/product_model.dart';
import 'package:untitled/product_service.dart';


class ProductList extends StatefulWidget {
  final List<Product> products;

  ProductList({required this.products});
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();

    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    final products = await ProductService().fetchProducts();
    setState(() {
      _products = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final product = _products[index];
        return ProductItem(product: product);
      },
    );
  }
}
class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(product.imageUrl),
        title: Text(product.name),
        subtitle: Text('\$${product.price}'),
      ),
    );
  }
}
