import 'package:flutter/material.dart';

class CatagoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catagoryTitle = routeArgs['title'];
    final catagoryId = routeArgs['id'];
    return Scaffold(
        appBar: AppBar(
          title: Text(catagoryTitle),
        ),
        body: Center(
          child: Text('MealsList'),
        ));
  }
}
