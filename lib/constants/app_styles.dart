import 'package:flutter/material.dart';

class AppStyles {
  // Light Theme Colors
  static const Color lightPrimaryColor = Color(0xFF2196F3);
  static const Color lightSecondaryColor = Color(0xFF1976D2);
  static const Color lightBackgroundColor = Color(0xFFFAFAFA);
  static const Color lightSurfaceColor = Color(0xFFFFFFFF);
  static const Color lightTextColor = Color(0xFF212121);
  static const Color lightSubtextColor = Color(0xFF757575);

  // Dark Theme Colors
  static const Color darkPrimaryColor = Color(0xFF90CAF9);
  static const Color darkSecondaryColor = Color(0xFF64B5F6);
  static const Color darkBackgroundColor = Color(0xFF121212);
  static const Color darkSurfaceColor = Color(0xFF1E1E1E);
  static const Color darkTextColor = Color(0xFFFFFFFF);
  static const Color darkSubtextColor = Color(0xFFBDBDBD);

  // Status Colors
  static const Color successColor = Color(0xFF4CAF50);
  static const Color errorColor = Color(0xFFE53935);
  static const Color warningColor = Color(0xFFFFA726);

  // Dimensions
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 8.0;

  // Text Styles
  static TextStyle headingStyle({bool isDark = false}) => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    color: isDark ? darkTextColor : lightTextColor,
  );

  static TextStyle subheadingStyle({bool isDark = false}) => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: isDark ? darkTextColor : lightTextColor,
  );

  // Decorations
  static BoxDecoration cardDecoration({bool isDark = false}) => BoxDecoration(
    color: isDark ? darkSurfaceColor : lightSurfaceColor,
    borderRadius: BorderRadius.circular(defaultBorderRadius),
    boxShadow: [
      BoxShadow(
        color: (isDark ? Colors.black : Colors.grey).withOpacity(0.1),
        spreadRadius: 1,
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
  );
} 