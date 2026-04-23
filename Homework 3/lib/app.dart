import 'package:flutter/material.dart';

import 'data/restaurant_data.dart';
import 'screens/root_shell.dart';
import 'theme/app_theme.dart';

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: demoRestaurant.name,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: RootShell(restaurant: demoRestaurant),
    );
  }
}
