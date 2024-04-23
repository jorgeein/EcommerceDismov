import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practica_siete/constant/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ReceivePort _receivePort;
  late Isolate _isolate;
  List _products = [];

  @override
  void initState() {
    super.initState();
    _initIsolate();
  }

  void _initIsolate() async {
    _receivePort = ReceivePort();
    _isolate = await Isolate.spawn(_isolateEntryPoint, _receivePort.sendPort);
    _receivePort.listen(_handleMessage);

    // Llamar a la función para obtener los productos
    _getProduct();
  }

  static void _isolateEntryPoint(SendPort sendPort) {
    ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    receivePort.listen((message) {
      // Esta función solo se ejecuta en el isolate, aquí puedes realizar operaciones de red u otras tareas intensivas en CPU
      // No tienes acceso a variables de instancia de la clase State
    });
  }

  void _handleMessage(dynamic data) {
    // Aquí recibirías mensajes del isolate, pero en este caso, no es necesario
  }

  Future<void> _getProduct() async {
    var url = Uri.parse(kProductUrl);
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    // Añadir el producto al array de productos
    setState(() {
      _products = data;
    });
  }

  @override
  void dispose() {
    _receivePort.close();
    _isolate.kill();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('e-Commerce'),
      ),
      body: _products.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          : GridView.builder(
        itemCount: _products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.5,
        ),
        itemBuilder: (context, index) {
          final product = _products[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                product['image'],
                width: 100,
                height: 100,
              ),
              SizedBox(height: 10),
              Text("${product['title']}"),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("\$${product['price']}"),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border),
                  )
                ],
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getProduct,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
