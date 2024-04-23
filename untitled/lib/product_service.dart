import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:untitled/product_model.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    debugPrint('This is a debug message');

    // Consumir la API REST y obtener los datos de los productos
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List<dynamic>;
      debugPrint('This is a debug message');
      List<Product> productList = [];
      for (var product in json) {
        productList.add(Product.fromJson(product));
      }
      return productList;
    } else {
      throw Exception('Error fetching products');
    }
  }
}