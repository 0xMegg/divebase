import 'package:flutter/material.dart';

const _primaryColor = Color(0xFF0E6E8D);
const _backgroundColor = Color(0xFFF6F8FA);
const _textColor = Color(0xFF1F2933);

ThemeData buildDiveBaseTheme() {
  final base = ThemeData.light();
  return base.copyWith(
    scaffoldBackgroundColor: _backgroundColor,
    colorScheme: base.colorScheme.copyWith(
      primary: _primaryColor,
      secondary: const Color(0xFF13A3B5),
      background: _backgroundColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: _textColor,
      elevation: 0,
      centerTitle: false,
    ),
    textTheme: base.textTheme.copyWith(
      titleLarge: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: _textColor,
      ),
      titleMedium: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: _textColor,
      ),
      bodyMedium: const TextStyle(
        fontSize: 14,
        color: _textColor,
      ),
      bodySmall: const TextStyle(
        fontSize: 12,
        color: Color(0xFF7B8794),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 12,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE4E7EB)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE4E7EB)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _primaryColor),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _textColor,
        minimumSize: const Size.fromHeight(48),
        side: const BorderSide(color: Color(0xFFD2D6DB)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}
