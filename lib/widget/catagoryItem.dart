import 'package:flutter/material.dart';

import '../pages/catagoryMealsScreen.dart';

class CatagoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CatagoryItem(this.id, this.title, this.color);

  void selectCatagory(BuildContext context) {
    Navigator.of(context).pushNamed(CatagoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCatagory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              color.withOpacity(0.7),
              color,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
