import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_styles.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeData get theme => _isDarkMode ? _darkTheme : _lightTheme;

  // Light theme data
  final ThemeData _lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppStyles.lightPrimaryColor,
    colorScheme: const ColorScheme.light(
      primary: AppStyles.lightPrimaryColor,
      secondary: AppStyles.lightSecondaryColor,
      surface: AppStyles.lightSurfaceColor,
      background: AppStyles.lightBackgroundColor,
      error: AppStyles.errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppStyles.lightTextColor,
      onBackground: AppStyles.lightTextColor,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: AppStyles.lightBackgroundColor,
    cardColor: AppStyles.lightSurfaceColor,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppStyles.lightTextColor),
      bodyMedium: TextStyle(color: AppStyles.lightTextColor),
      titleMedium: TextStyle(color: AppStyles.lightTextColor),
      titleLarge: TextStyle(color: AppStyles.lightTextColor),
      labelLarge: TextStyle(color: AppStyles.lightTextColor),
    ),
    iconTheme: const IconThemeData(
      color: AppStyles.lightTextColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppStyles.lightPrimaryColor,
      foregroundColor: Colors.white,
    ),
  );

  // Dark theme data
  final ThemeData _darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppStyles.darkPrimaryColor,
    colorScheme: const ColorScheme.dark(
      primary: AppStyles.darkPrimaryColor,
      secondary: AppStyles.darkSecondaryColor,
      surface: AppStyles.darkSurfaceColor,
      background: AppStyles.darkBackgroundColor,
      error: AppStyles.errorColor,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: AppStyles.darkTextColor,
      onBackground: AppStyles.darkTextColor,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: AppStyles.darkBackgroundColor,
    cardColor: AppStyles.darkSurfaceColor,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppStyles.darkTextColor),
      bodyMedium: TextStyle(color: AppStyles.darkTextColor),
      titleMedium: TextStyle(color: AppStyles.darkTextColor),
      titleLarge: TextStyle(color: AppStyles.darkTextColor),
      labelLarge: TextStyle(color: AppStyles.darkTextColor),
    ),
    iconTheme: const IconThemeData(
      color: AppStyles.darkTextColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppStyles.darkPrimaryColor,
      foregroundColor: Colors.black,
    ),
  );

  ThemeProvider() {
    _loadThemeFromPrefs();
  }

  Future<void> _loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  Future<void> _saveThemeToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _saveThemeToPrefs();
    notifyListeners();
  }
} 