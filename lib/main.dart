import 'package:flutter/material.dart';
import 'package:portpolio_favorite_flutter/homeScreen.dart';

void main() {
  runApp(const MyApp());
}gi

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}

 