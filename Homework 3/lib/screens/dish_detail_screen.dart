import 'package:flutter/material.dart';

import '../models/dish.dart';
import '../widgets/dish_image.dart';

class DishDetailScreen extends StatelessWidget {
  const DishDetailScreen({super.key, required this.dish});

  final Dish dish;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 340,
            pinned: true,
            stretch: true,
            backgroundColor: dish.accentColor,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
              title: Text(
                dish.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  DishImage(dish: dish, borderRadius: 0, fit: BoxFit.cover),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          dish.accentColor.withValues(alpha: 0.10),
                          dish.accentColor.withValues(alpha: 0.45),
                          Colors.black.withValues(alpha: 0.55),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 90,
                    right: -10,
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -20),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF6EFE5),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 18, 24, 34),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _FactPill(label: dish.category),
                          _FactPill(label: dish.prepTime),
                          _FactPill(
                            label: '${dish.price.toStringAsFixed(2)} EUR',
                          ),
                        ],
                      ),
                      const SizedBox(height: 22),
                      Text(
                        dish.shortDescription,
                        style: theme.textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 14),
                      Text(dish.details, style: theme.textTheme.bodyLarge),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.image_outlined, color: dish.accentColor),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Prepared to order and finished with the house garnish of the day.',
                                style: theme.textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      Text('Ingredients', style: theme.textTheme.titleLarge),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: dish.ingredients
                            .map(
                              (ingredient) =>
                                  _IngredientChip(label: ingredient),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 28),
                      Text(
                        'Suggested pairing',
                        style: theme.textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                          dish.pairing,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                      const SizedBox(height: 28),
                      ElevatedButton.icon(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Return to menu'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FactPill extends StatelessWidget {
  const _FactPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(label, style: Theme.of(context).textTheme.labelLarge),
    );
  }
}

class _IngredientChip extends StatelessWidget {
  const _IngredientChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFEBDDCE),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(label),
    );
  }
}
