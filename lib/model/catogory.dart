import 'package:flutter/material.dart';

class Catagory {
  final String title;
  final String? id;
  final Color? color;

  const Catagory(
      { @required this.id,required this.title, this.color = Colors.red});
}
