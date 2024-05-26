import 'package:flutter/material.dart';
import 'start_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Evergreen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: StartScreen(),
    );
  }
}
