import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/model/meals.dart';
import 'package:meals_app/screen/category_meals_screen.dart';
import 'package:meals_app/screen/filter_screen.dart';
import 'package:meals_app/screen/meal_detail_screen.dart';
import 'package:meals_app/screen/tab_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _available = dummyMeals;
  final List<Meal> _favMeal = [];

  Map<String, bool> _filter = {
    "gluten": false,
    "lactose": false,
    "vegatarin": false,
    "vegan": false,
  };
  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;
      _available = dummyMeals.where((meal) {
        if (_filter["gluten"]! && !meal.isGlutenFree!) {
          return false;
        }
        if (_filter["lactose"]! && !meal.isLactoseFree!) {
          return false;
        }
        if (_filter["vegan"]! && !meal.isVegan!) {
          return false;
        }
        if (_filter["vegatarian"]! && !meal.isVegetarian!) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggle(String mealId) {
    final existingIndex = _favMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favMeal.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFav(String mealId) {
    return _favMeal.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      title: "Daily Miles",
      // home: const CatagoriesScreen(),
      routes: {
        "/": (context) => TabScreen(_favMeal),
        "/catagory-meals-screen": (context) => CatogoryMealsScreen(_available),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggle, _isMealFav),
        "/filter-screen": (context) => FilterScreen(
              _setFilter,
            ),
      },
    );
  }
}
