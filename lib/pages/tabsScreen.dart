import 'package:flutter/material.dart';
import './catagoriesScreen.dart';
import '../widget/mainDrawer.dart';
import './favoriteScreen.dart';

class TabsScreen extends StatefulWidget {
  final List favoriteMeals;

  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Catagory',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favorite',
              ),
            ],
          ),
        ),
        drawer: MainDrawer(),
        body: TabBarView(
          children: [CatagoriesScreen(), FavoriteScreen(widget.favoriteMeals)],
        ),
      ),
    );
  }
}

// for bottom tabs - bottomNavigatorBar
