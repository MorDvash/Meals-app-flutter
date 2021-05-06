import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './catagoryMealsScreen.dart';

class CatagoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CatagoryItem(this.title, this.color);

  void selectCatagory(BuildContext context) {
    Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
      return CatagoryMealsScreen();
    }));
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
