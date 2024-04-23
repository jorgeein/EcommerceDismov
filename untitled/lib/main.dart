import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:untitled/product_list.dart';
import 'package:untitled/product_model.dart'; // Import the Product model
import 'package:untitled/product_service.dart'; // Import the ProductService
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<Product>>? _products;
  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    final products = await ProductService().fetchProducts();
    setState(() {
      _products = Future.value(products); // Update state with fetched products
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce Gallery',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('E-commerce Gallery'),
        ),
          body: FutureBuilder<List<Product>>(
            future: _products,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }if (snapshot.data != null) { // Check if data is not null
                return ProductList(products: snapshot.data!); // Use null check operator
              } else {
                return Center(child: Text('No products found')); // Handle no data case
              }
            },
          ),
      ),
    );
  }
}