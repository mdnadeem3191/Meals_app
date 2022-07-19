import 'package:flutter/material.dart';
import 'package:meals_app/widget/meal_item.dart';

class FavScreen extends StatelessWidget {
  final List favMeal;
  const FavScreen(this.favMeal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favMeal.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "You have no added favourites yet - Start adding some!",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) => MealItem(
          id: favMeal[index].id,
          title: favMeal[index].title,
          imageUrl: favMeal[index].imageUrl,
          affordability: favMeal[index].affordability,
          duration: favMeal[index].duration,
          complexity: favMeal[index].complexity,
        ),
        itemCount: favMeal.length,
      );
    }
  }
}
