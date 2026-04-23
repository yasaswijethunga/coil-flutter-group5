import 'package:flutter/material.dart';

import '../models/dish.dart';
import '../models/restaurant.dart';
import '../widgets/dish_image.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({
    super.key,
    required this.restaurant,
    required this.onSelectDish,
  });

  final Restaurant restaurant;
  final ValueChanged<Dish> onSelectDish;

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.restaurant.categories.first;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dishes = widget.restaurant.dishesFor(selectedCategory);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF6EFE5), Color(0xFFF0E2D5)],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 18, 24, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Menu', style: theme.textTheme.displayMedium),
              const SizedBox(height: 8),
              Text(
                'From light starters to slow-finished desserts, every dish is grouped to make browsing easy.',
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 18),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFF201713),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.restaurant.name,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${widget.restaurant.categories.length} categories  |  ${widget.restaurant.menu.length} dishes  |  served daily',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: const Color(0xFFF4E6D8),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: widget.restaurant.categories.map((category) {
                  return ChoiceChip(
                    label: Text(category),
                    selected: selectedCategory == category,
                    onSelected: (_) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 18),
              Text(
                '$selectedCategory category',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 6),
              Text(
                'Open any dish for ingredients, pairings, and kitchen notes.',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Column(
                  key: ValueKey<String>(selectedCategory),
                  children: dishes
                      .map(
                        (dish) => Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: _DishCard(
                            dish: dish,
                            onTap: () => widget.onSelectDish(dish),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DishCard extends StatelessWidget {
  const _DishCard({required this.dish, required this.onTap});

  final Dish dish;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(26),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(26),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              DishImage(dish: dish, height: 94, width: 94, borderRadius: 24),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dish.name, style: theme.textTheme.titleLarge),
                    const SizedBox(height: 5),
                    Text(
                      dish.shortDescription,
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _MetaChip(label: dish.prepTime),
                        _MetaChip(
                          label: '${dish.price.toStringAsFixed(2)} EUR',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.arrow_forward_ios_rounded, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  const _MetaChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF1E7DA),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(label),
    );
  }
}
