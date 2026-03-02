import 'package:flutter/material.dart';

class AppTheme {
  static const _seed = Color(0xFF6C63FF);

  static ThemeData darkTheme() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(seedColor: _seed, brightness: Brightness.dark),
    );

    return base.copyWith(
      scaffoldBackgroundColor: const Color(0xFF080A14),
      appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
      cardTheme: CardTheme(
        color: Colors.white.withOpacity(0.08),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white.withOpacity(0.06),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
      ),
    );
  }

  static ThemeData lightTheme() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(seedColor: _seed, brightness: Brightness.light),
    );

    return base.copyWith(
      cardTheme: CardTheme(
        color: Colors.white.withOpacity(0.8),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
