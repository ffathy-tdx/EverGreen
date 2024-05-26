import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'model.dart'; // Ensure you import the model.dart where SecondScreen is defined

class ScannedImagesScreen extends StatelessWidget {
  final List<String> images;

  ScannedImagesScreen({required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanned Images'),
        backgroundColor: Color(0xFFCCEECC),
      ),
      backgroundColor: Color(0xFFCCEECC),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreen(
                    image: XFile(images[index]),
                  ),
                ),
              );
            },
            child: Image.file(File(images[index])),
          );
        },
      ),
    );
  }
}
