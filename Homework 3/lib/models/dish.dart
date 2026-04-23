import 'package:flutter/material.dart';

class Dish {
  const Dish({
    required this.id,
    required this.category,
    required this.name,
    required this.imagePath,
    required this.shortDescription,
    required this.details,
    required this.price,
    required this.prepTime,
    required this.ingredients,
    required this.pairing,
    required this.accentColor,
  });

  final String id;
  final String category;
  final String name;
  final String imagePath;
  final String shortDescription;
  final String details;
  final double price;
  final String prepTime;
  final List<String> ingredients;
  final String pairing;
  final Color accentColor;

  String get heroTag => 'dish-image-$id';
}
