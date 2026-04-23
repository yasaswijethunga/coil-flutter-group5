import 'package:flutter/material.dart';

import '../models/dish.dart';
import '../models/restaurant.dart';
import '../widgets/dish_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.restaurant,
    required this.onOpenMenu,
    required this.onSelectDish,
  });

  final Restaurant restaurant;
  final VoidCallback onOpenMenu;
  final ValueChanged<Dish> onSelectDish;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF8F2E8), Color(0xFFF2E4D8)],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 18, 24, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.75),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      'Lakeside dining',
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  const Spacer(),
                  IconButton.filledTonal(
                    onPressed: onOpenMenu,
                    icon: const Icon(Icons.restaurant_menu_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF251A17), Color(0xFFB55C3A)],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x221A120F),
                      blurRadius: 28,
                      offset: Offset(0, 18),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: const Text(
                        'Seasonal table',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      restaurant.name,
                      style: theme.textTheme.displayMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      restaurant.tagline,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: const Color(0xFFF9EBDD),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      restaurant.description,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFFF9EBDD),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 14,
                      runSpacing: 14,
                      children: [
                        ElevatedButton(
                          onPressed: onOpenMenu,
                          child: const Text('View menu'),
                        ),
                        OutlinedButton(
                          onPressed: () => _showAboutSheet(context),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white70),
                          ),
                          child: const Text('About us'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _InfoCard(
                    label: 'Open today',
                    value: restaurant.hours,
                    icon: Icons.schedule_rounded,
                  ),
                  _InfoCard(
                    label: 'Find us',
                    value: restaurant.location,
                    icon: Icons.place_outlined,
                  ),
                  _InfoCard(
                    label: 'Call',
                    value: restaurant.phone,
                    icon: Icons.call_outlined,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text('Why guests return', style: theme.textTheme.titleLarge),
              const SizedBox(height: 12),
              ...restaurant.houseNotes.map(
                (note) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Icon(Icons.circle, size: 8),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(note, style: theme.textTheme.bodyLarge),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 26),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Signature picks',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  Text(
                    '${restaurant.menu.length} dishes',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'A quick look at the dishes guests order first.',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 14),
              ...restaurant.menu
                  .take(3)
                  .map(
                    (dish) => Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(26),
                        child: InkWell(
                          onTap: () => onSelectDish(dish),
                          borderRadius: BorderRadius.circular(26),
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Row(
                              children: [
                                DishImage(
                                  dish: dish,
                                  height: 88,
                                  width: 88,
                                  borderRadius: 22,
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        dish.name,
                                        style: theme.textTheme.titleLarge,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        dish.shortDescription,
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${dish.price.toStringAsFixed(2)} EUR',
                                      style: theme.textTheme.labelLarge,
                                    ),
                                    const SizedBox(height: 14),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAboutSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final theme = Theme.of(context);
        return Container(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 30),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(restaurant.name, style: theme.textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text(restaurant.description, style: theme.textTheme.bodyLarge),
              const SizedBox(height: 18),
              Text(
                'Categories: ${restaurant.categories.join(', ')}',
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Hours: ${restaurant.hours}',
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Location: ${restaurant.location}',
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Phone: ${restaurant.phone}',
                style: theme.textTheme.bodyLarge,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: 220,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon),
            const SizedBox(height: 18),
            Text(label, style: theme.textTheme.labelLarge),
            const SizedBox(height: 8),
            Text(value, style: theme.textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
