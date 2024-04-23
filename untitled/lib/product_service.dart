import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:untitled/product_model.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    // Consumir la API REST y obtener los datos de los productos
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List<dynamic>;
      return json.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Error fetching products');
    }
  }
}