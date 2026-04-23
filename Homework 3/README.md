# Ember and Thyme

Flutter restaurant app project.

## What is included

- Home screen with restaurant information, opening hours, and featured dishes
- Menu screen with category filters for starters, main courses, desserts, and drinks
- Dish details screen opened by tapping a dish card
- Bottom navigation bar for moving between the home and menu screens
- Hardcoded restaurant and dish data
- Local dish image assets used on cards and in the details header
- Custom warm-toned theme with a restaurant-focused visual style

## Technical concepts used

- Multiple screens and navigation
- Data passing between screens using the selected `Dish`
- List-based menu presentation with category filtering
- Modular structure with separate files for models, data, theme, screens, and widgets
- Local asset handling through `pubspec.yaml`

## Main files

- `lib/app.dart`
- `lib/screens/root_shell.dart`
- `lib/screens/home_screen.dart`
- `lib/screens/menu_screen.dart`
- `lib/screens/dish_detail_screen.dart`
- `lib/data/restaurant_data.dart`

## Run the app

```bash
flutter run
```
