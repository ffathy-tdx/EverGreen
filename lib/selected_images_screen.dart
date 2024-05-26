import 'dart:io';
import 'package:flutter/material.dart';

class SelectedImagesScreen extends StatelessWidget {
  final List<String> images;

  SelectedImagesScreen({required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Images'),
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
              print('Image ${index + 1} clicked!');
              _showImageDialog(context, images[index]);
            },
            child: Image.file(File(images[index])),
          );
        },
      ),
    );
  }

  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Image.file(File(imagePath)),
          ),
        );
      },
    );
  }
}
