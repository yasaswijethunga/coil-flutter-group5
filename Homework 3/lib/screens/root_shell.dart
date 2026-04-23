import 'package:flutter/material.dart';

import '../models/dish.dart';
import '../models/restaurant.dart';
import 'dish_detail_screen.dart';
import 'home_screen.dart';
import 'menu_screen.dart';

class RootShell extends StatefulWidget {
  const RootShell({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      HeroMode(
        enabled: currentIndex == 0,
        child: HomeScreen(
          restaurant: widget.restaurant,
          onOpenMenu: () => _selectTab(1),
          onSelectDish: _openDishDetails,
        ),
      ),
      HeroMode(
        enabled: currentIndex == 1,
        child: MenuScreen(
          restaurant: widget.restaurant,
          onSelectDish: _openDishDetails,
        ),
      ),
    ];

    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: SafeArea(
        top: false,
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: NavigationBar(
            selectedIndex: currentIndex,
            onDestinationSelected: _selectTab,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.restaurant_menu_outlined),
                selectedIcon: Icon(Icons.restaurant_menu_rounded),
                label: 'Menu',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void _openDishDetails(Dish dish) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => DishDetailScreen(dish: dish)),
    );
  }
}
