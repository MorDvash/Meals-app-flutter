import 'package:flutter/material.dart';

import 'package:meals_app/catagoryData.dart';
import 'package:meals_app/models/meals.dart';
import './pages/catagoryMealsScreen.dart';
import './pages/filtersScreen.dart';
import './pages/mealDetalisScreen.dart';
import './pages/tabsScreen.dart';

import 'pages/catagoriesScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegen': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegen'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toogleFavorite(String mealId) {
    final isIndexExsits =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (isIndexExsits >= 0) {
      setState(() {
        _favoriteMeals.removeAt(isIndexExsits);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      // home: CatagoriesScreen(),
      //מאפשר לשנות את שם של ראווט של הhome
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        CatagoryMealsScreen.routeName: (context) =>
            CatagoryMealsScreen(_availableMeals),
        MealDetailsScreen.routeName: (context) =>
            MealDetailsScreen(_toogleFavorite, _isFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters),
      },
      // onGenerateRoute: (settings) {

      // },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => CatagoriesScreen(),
      ),
    );
  }
}
