import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/mealDetailScreen';

  final Function? _toggleButtons;
  final Function? isMealFav;
  const MealDetailScreen(this._toggleButtons, this.isMealFav, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(
                isMealFav!(mealId) ? Icons.favorite : Icons.favorite_border),
            onPressed: () => _toggleButtons!(mealId)),
        appBar: AppBar(
          title: Text("${selectedMeal.title}"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  "${selectedMeal.imageUrl}",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  "Ingredient",
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                height: 200,
                width: 300,
                child: ListView.builder(
                  itemBuilder: (context, index) => Card(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients![index]),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients!.length,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                height: 200,
                width: 300,
                child: ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        title: Text("${selectedMeal.steps}"),
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                  itemCount: selectedMeal.steps!.length,
                ),
              ),
            ],
          ),
        ));
  }
}
