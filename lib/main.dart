import 'package:flutter/material.dart';
import './pages/catagoryMealsScreen.dart';
import './pages/filtersScreen.dart';
import './pages/mealDetalisScreen.dart';
import './pages/tabsScreen.dart';

import 'pages/catagoriesScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        '/': (context) => TabsScreen(),
        CatagoryMealsScreen.routeName: (context) => CatagoryMealsScreen(),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(),
      },
      // onGenerateRoute: (settings) {

      // },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => CatagoriesScreen(),
      ),
    );
  }
}
