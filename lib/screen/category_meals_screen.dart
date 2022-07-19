import 'package:flutter/material.dart';
import 'package:meals_app/model/meals.dart';
import 'package:meals_app/widget/meal_item.dart';

class CatogoryMealsScreen extends StatefulWidget {
  List<Meal> availableMeal; 
  CatogoryMealsScreen(this.availableMeal, {Key? key}) : super(key: key);

  @override
  State<CatogoryMealsScreen> createState() => _CatogoryMealsScreenState();
}

class _CatogoryMealsScreenState extends State<CatogoryMealsScreen> {
  // final String? catId;
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map;
    final catagoryTitle = routeArgs['title'];
    final catagoryId = routeArgs['id'];
    final catColor = routeArgs['color'];

    // final categoryMeal = dummyMeals.where((meal) {
    final categoryMeal = widget.availableMeal.where((meal) {
      return meal.categories!.contains(catagoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: catColor,
        title: Text(
          catagoryTitle!,
          // style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryMeal[index].id,
            title: categoryMeal[index].title,
            imageUrl: categoryMeal[index].imageUrl,
            affordability: categoryMeal[index].affordability,
            duration: categoryMeal[index].duration,
            complexity: categoryMeal[index].complexity,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
