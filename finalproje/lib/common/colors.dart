import 'package:finalproje/features/comment/views/comment.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Yorum());
}

class Yorum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yemek Uygulaması',
      home: FoodDetailsPage(),
    );
  }
}
