// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meals_app/model/meals.dart';
import 'package:meals_app/screen/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String? title;
  final String? id;
  final String? imageUrl;
  final int? duration;
  final Complexity? complexity;
  final Affordability? affordability;
  const MealItem(
      {Key? key,
      this.id,
      this.title,
      this.imageUrl,
      this.duration,
      this.complexity,
      this.affordability})
      : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "simple";

      case Complexity.Hard:
        return "Hard";

      case Complexity.Challenging:
        return "Challenging";

      default:
        return "unknown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Afordable";

      case Affordability.Pricey:
        return "Pricey";
      case Affordability.Luxurious:
        return "Expensive";

      default:
        return "unknown";
    }
  }

  void selecetMeal(BuildContext context) {
    Navigator.pushNamed(context, MealDetailScreen.routeName, arguments: id)
        .then((result) {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selecetMeal(context),
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl!,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: 300,
                    color: Colors.black54,
                    child: Text(
                      title!,
                      style: const TextStyle(
                        fontSize: 26,
                        // overflow: TextOverflow.fade,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
