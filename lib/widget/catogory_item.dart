import 'package:flutter/material.dart';

class CatagoryItem extends StatelessWidget {
  final String? title;
  final Color? color;
  final String? id;
  const CatagoryItem({Key? key, this.title, this.color, this.id})
      : super(key: key);

  _selectCatagory(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/catagory-meals-screen',
      arguments: {
        'id': id,
        'title': title,
        'color': color,
      },
      // MaterialPageRoute(builder: (_) {
      //   return CatogoryMealsScreen(catId: id, catTitle: title);
      // }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectCatagory(context);
      },
      splashColor: ThemeData().primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title!,
          style: const TextStyle(fontSize: 18),
        ),
        decoration: BoxDecoration(
            color: color,
            gradient: LinearGradient(colors: [
              color!.withOpacity(0.7),
              color!,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
