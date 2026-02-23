import 'package:flutter/material.dart';

/// Dana's 2차 화면 타이포그래피 (기본 Material + Figma 스타일 보조).
TextTheme get appTextTheme {
  return TextTheme(
    headlineLarge: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: const TextStyle(fontSize: 16),
    bodyMedium: const TextStyle(fontSize: 14),
    bodySmall: const TextStyle(fontSize: 12),
    labelLarge: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  );
}
