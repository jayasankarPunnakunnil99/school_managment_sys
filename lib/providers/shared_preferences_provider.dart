import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider with ChangeNotifier {
  static const String _roleKey = 'user_role';
  static const String _themeKey = 'app_theme';
  static const String _isAuthenticatedKey = 'is_authenticated';
  // Add more keys as needed

  String? _role;
  bool _isDarkMode = false;
  bool _isAuthenticated = false;

  String? get role => _role;
  bool get isDarkMode => _isDarkMode;
  bool get isAuthenticated => _isAuthenticated;

  // Save authentication state
  Future<void> setAuthenticated(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isAuthenticatedKey, value);
    _isAuthenticated = value;
    notifyListeners();
  }

  // Check authentication state
  Future<bool> checkAuthentication() async {
    final prefs = await SharedPreferences.getInstance();
    _isAuthenticated = prefs.getBool(_isAuthenticatedKey) ?? false;
    notifyListeners();
    return _isAuthenticated;
  }

  Future<void> setRole(String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_roleKey, role);
    _role = role;
    notifyListeners();
  }

  Future<void> setTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDark);
    _isDarkMode = isDark;
    notifyListeners();
  }

  Future<void> loadSavedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _role = prefs.getString(_roleKey);
    _isDarkMode = prefs.getBool(_themeKey) ?? false;
    _isAuthenticated = prefs.getBool(_isAuthenticatedKey) ?? false;
    notifyListeners();
  }

  Future<void> clearPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_roleKey);
    await prefs.remove(_themeKey);
    await prefs.remove(_isAuthenticatedKey);
    _role = null;
    _isDarkMode = false;
    _isAuthenticated = false;
    notifyListeners();
  }

  // Static method to check authentication without context
  static Future<bool> isAuthenticatedStatic() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isAuthenticatedKey) ?? false;
  }
} 