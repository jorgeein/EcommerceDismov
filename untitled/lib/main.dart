import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Define a list of image paths (replace with your actual image paths)
  static const List<String> imagePaths = [
    'assets/image1.jpg',
    'assets/image2.png',
    'assets/image3.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Gallery',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image Gallery'),
        ),
        body: GridView.count(
          // Adjust crossAxisCount for desired number of images per row
          crossAxisCount: 2,
          children: imagePaths.map((imagePath) => _buildImageItem(imagePath)).toList(),
        ),
      ),
    );
  }

  Widget _buildImageItem(String imagePath) {
    return InkWell(
      onTap: () {
        // Handle image tap event (optional)
        // You can navigate to a detail screen or perform other actions here
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
