import 'package:flutter/material.dart';
import '../widget/mainDrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarin = false;
  var _vegen = false;
  var _lactosFree = false;

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateCurrentValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updateCurrentValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile('Gluten-free',
                    'Only include gluten-free meals.', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile('Vegetrian-free',
                    'Only include Vegetrian meals.', _vegetarin, (newValue) {
                  setState(() {
                    _vegetarin = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegen-free', 'Only include Vegen meals.', _vegen,
                    (newValue) {
                  setState(() {
                    _vegen = newValue;
                  });
                }),
                _buildSwitchListTile('Lactos-free',
                    'Only include lactos-free meals.', _lactosFree, (newValue) {
                  setState(() {
                    _lactosFree = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
