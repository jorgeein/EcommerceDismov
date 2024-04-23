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
  Future<void> _fetchProducts() async {
    final products = await ProductService().fetchProducts();
    setState(() {
      _products = products;
    });
  }
  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.products.isEmpty) {
      return Center(child: Text('No productooouss found')); // Handle empty list
    } else {
      return ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          final product = widget.products[index];
          return ProductItem(product: product);
        },
      );
    }
  }}
class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(product.image),
        title: Text(product.title),
        subtitle: Text('\$${product.price}'),
      ),
    );
  }
}
