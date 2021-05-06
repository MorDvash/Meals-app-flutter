import 'package:flutter/material.dart';

class CatagoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List of Meals'),
        ),
        body: Center(
          child: Text('MealsList'),
        ));
  }
}
