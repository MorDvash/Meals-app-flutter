import 'package:flutter/material.dart';

class CatagoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CatagoryItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(title),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        color.withOpacity(0.7),
        color,
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
    );
  }
}