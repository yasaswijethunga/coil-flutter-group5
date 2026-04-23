import 'package:flutter/material.dart';

import '../models/dish.dart';

class DishImage extends StatelessWidget {
  const DishImage({
    super.key,
    required this.dish,
    this.width,
    this.height,
    this.borderRadius = 24,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.enableHero = true,
  });

  final Dish dish;
  final double? width;
  final double? height;
  final double borderRadius;
  final BoxFit fit;
  final Alignment alignment;
  final bool enableHero;

  @override
  Widget build(BuildContext context) {
    Widget content = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: ColoredBox(
        color: dish.accentColor.withValues(alpha: 0.16),
        child: Image.asset(
          dish.imagePath,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
          errorBuilder: (_, _, _) =>
              _FallbackDishArt(dish: dish, width: width, height: height),
        ),
      ),
    );

    if (width != null || height != null) {
      content = SizedBox(width: width, height: height, child: content);
    }

    if (enableHero) {
      content = Hero(tag: dish.heroTag, child: content);
    }

    return content;
  }
}

class _FallbackDishArt extends StatelessWidget {
  const _FallbackDishArt({
    required this.dish,
    required this.width,
    required this.height,
  });

  final Dish dish;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            dish.accentColor.withValues(alpha: 0.9),
            dish.accentColor.withValues(alpha: 0.55),
          ],
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        dish.name.substring(0, 1),
        style: theme.textTheme.headlineMedium?.copyWith(color: Colors.white),
      ),
    );
  }
}
