import 'package:flutter/material.dart';

class AppTheme {
  static const Color afsPrimary = Color(0xFF1B6CA8);
  static const Color afsAccent = Color(0xFF1282A2);
  static const Color afsDarkBg = Color(0xFF0A2239);
  static const Color afsLightBg = Color(0xFFF5F7FA);
  static const Color afsChipBg = Color(0xFFC5CAE9);
  static const Color afsChipSelected = Color(0xFF3949AB);

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: afsPrimary,
    scaffoldBackgroundColor: afsLightBg,
    colorScheme: ColorScheme.light(
      primary: afsPrimary,
      secondary: afsAccent,
      background: afsLightBg,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: afsPrimary,
      foregroundColor: Colors.white,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: afsPrimary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: afsChipBg,
      selectedColor: afsChipSelected,
      disabledColor: Colors.grey.shade300,
      secondarySelectedColor: afsPrimary,
      labelStyle: const TextStyle(color: Colors.black),
      secondaryLabelStyle: const TextStyle(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      brightness: Brightness.light,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: afsAccent,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: afsPrimary,
    scaffoldBackgroundColor: afsDarkBg,
    colorScheme: ColorScheme.dark(
      primary: afsPrimary,
      secondary: afsAccent,
      background: afsDarkBg,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: afsPrimary,
      foregroundColor: Colors.white,
    ),
    cardTheme: CardTheme(
      color: const Color(0xFF1C2A3A),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: afsAccent,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF1E2F40),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: const Color(0xFF3A4A5A),
      selectedColor: afsPrimary,
      disabledColor: Colors.grey.shade800,
      secondarySelectedColor: afsAccent,
      labelStyle: const TextStyle(color: Colors.white),
      secondaryLabelStyle: const TextStyle(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      brightness: Brightness.dark,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: afsAccent,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
