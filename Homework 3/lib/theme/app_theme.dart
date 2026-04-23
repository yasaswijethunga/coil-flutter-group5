import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const Color _cream = Color(0xFFF6EFE5);
  static const Color _ink = Color(0xFF241A16);
  static const Color _terracotta = Color(0xFFB85C38);
  static const Color _olive = Color(0xFF697353);
  static const Color _sand = Color(0xFFE8DCCB);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme:
        ColorScheme.fromSeed(
          seedColor: _terracotta,
          brightness: Brightness.light,
        ).copyWith(
          primary: _terracotta,
          onPrimary: Colors.white,
          secondary: _olive,
          onSecondary: Colors.white,
          surface: Colors.white,
          onSurface: _ink,
          surfaceContainerHighest: _sand,
        ),
    scaffoldBackgroundColor: _cream,
    fontFamily: 'Georgia',
    textTheme: ThemeData.light().textTheme.copyWith(
      displayLarge: const TextStyle(
        fontSize: 54,
        fontWeight: FontWeight.w300,
        height: 1,
        color: _ink,
      ),
      displayMedium: const TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w300,
        height: 1.05,
        color: _ink,
      ),
      headlineMedium: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: _ink,
      ),
      titleLarge: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: _ink,
      ),
      bodyLarge: const TextStyle(
        fontSize: 16,
        height: 1.5,
        color: Color(0xFF3B302B),
      ),
      bodyMedium: const TextStyle(
        fontSize: 14,
        height: 1.45,
        color: Color(0xFF4C403A),
      ),
      labelLarge: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.4,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      foregroundColor: _ink,
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: _ink,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _ink,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        textStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _ink,
        side: const BorderSide(color: _ink, width: 1.1),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        textStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.white,
      selectedColor: _ink,
      secondarySelectedColor: _ink,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      labelStyle: const TextStyle(fontWeight: FontWeight.w700, color: _ink),
      secondaryLabelStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      side: const BorderSide(color: Color(0xFFDED2C2)),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white,
      indicatorColor: _sand,
      height: 74,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final isSelected = states.contains(WidgetState.selected);
        return TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: isSelected ? _ink : const Color(0xFF6A5A53),
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final isSelected = states.contains(WidgetState.selected);
        return IconThemeData(
          color: isSelected ? _ink : const Color(0xFF6A5A53),
        );
      }),
    ),
  );
}
