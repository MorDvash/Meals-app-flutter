import 'package:flutter/material.dart';
import 'package:meals_app/widget/mealItem.dart';

class CatagoryMealsScreen extends StatelessWidget {
  static const routeName = '/catagory-meals';
  final List availableMeals;

  CatagoryMealsScreen(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catagoryTitle = routeArgs['title'];
    final catagoryId = routeArgs['id'];
    final catagoryMeals = availableMeals
        .where((meal) => meal.categories.contains(catagoryId))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(catagoryTitle),
        ),
        body: ListView.builder(
          itemCount: catagoryMeals.length,
          itemBuilder: (context, index) {
            return MealItem(
                id: catagoryMeals[index].id,
                title: catagoryMeals[index].title,
                imageUrl: catagoryMeals[index].imageUrl,
                duration: catagoryMeals[index].duration,
                complexity: catagoryMeals[index].complexity,
                affordability: catagoryMeals[index].affordability);
          },
        ));
  }
}
