import 'dart:collection';

import 'dish.dart';

class Restaurant {
  const Restaurant({
    required this.name,
    required this.tagline,
    required this.description,
    required this.location,
    required this.hours,
    required this.phone,
    required this.houseNotes,
    required this.menu,
  });

  final String name;
  final String tagline;
  final String description;
  final String location;
  final String hours;
  final String phone;
  final List<String> houseNotes;
  final List<Dish> menu;

  List<String> get categories =>
      LinkedHashSet<String>.from(menu.map((dish) => dish.category)).toList();

  List<Dish> dishesFor(String category) =>
      menu.where((dish) => dish.category == category).toList();
}
