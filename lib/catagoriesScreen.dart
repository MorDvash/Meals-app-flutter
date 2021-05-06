import 'package:flutter/material.dart';

import './catagoryData.dart';
import './catagoryItem.dart';

class CatagoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: GridView(
          padding: EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map((catData) => CatagoryItem(catData.title, catData.color))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          )),
    );
  }
}
