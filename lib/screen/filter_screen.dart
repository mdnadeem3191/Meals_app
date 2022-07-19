import 'package:flutter/material.dart';
import 'package:meals_app/widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function saveFilter;
  const FilterScreen(this.saveFilter, {Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegaatarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MainDrawer(),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    "gluten": _glutenFree,
                    "lactose": _lactoseFree,
                    "vegatarin": _vegaatarian,
                    "vegan": _vegan,
                  };
                  widget.saveFilter();
                },
                icon: const Icon(Icons.save))
          ],
          title: const Text("Your Filters"),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Adjust Your Meal Selection",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                SwitchListTile(
                    title: const Text("Gluten-Free"),
                    subtitle: const Text("only include Gluten-Free meal"),
                    value: _glutenFree,
                    onChanged: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                SwitchListTile(
                    title: const Text("Lactose-Free"),
                    subtitle: const Text("only include Lactose-Free meal"),
                    value: _lactoseFree,
                    onChanged: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
                SwitchListTile(
                    title: const Text("Vegatarian"),
                    subtitle: const Text("only include Vegatarian meal"),
                    value: _vegaatarian,
                    onChanged: (newValue) {
                      setState(() {
                        _vegaatarian = newValue;
                      });
                    }),
                SwitchListTile(
                    title: const Text("Vegas"),
                    subtitle: const Text("only include Vegan meal"),
                    value: _vegan,
                    onChanged: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
              ],
            ))
          ],
        ));
  }
}
