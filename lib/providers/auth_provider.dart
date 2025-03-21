import 'package:flutter/foundation.dart';
import 'package:school_management_system/providers/shared_preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/auth_data.dart';

class AuthProvider with ChangeNotifier {
  AuthData? _authData;
  String? _errorMessage;

  static const String _tokenKey = 'auth_token';
  static const String _userIdKey = 'auth_user_id';
  static const String _emailKey = 'auth_email';
  static const String _roleKey = 'auth_role';
  static const String _expiryDateKey = 'auth_expiry_date';

  final SupabaseClient supabase = Supabase.instance.client;
  AuthData? get authData => _authData;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated =>
      _authData != null && _authData!.expiryDate.isAfter(DateTime.now());

  /// Sign Up Method (Returns `bool` to indicate success)
  Future<bool> signUp(String email, String password) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      if (response.user != null) {
        return true;
      } else {
        _errorMessage = "Signup failed.";
        return false;
      }
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      _errorMessage = null;

      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        _authData = AuthData(
          token: response.session?.accessToken ?? '',
          userId: response.user!.id,
          email: email,
          role: role,
          expiryDate: DateTime.now().add(
            Duration(seconds: response.session?.expiresIn ?? 3600),
          ),
          
        );

        // Save to local storage
        await _saveAuthData();

        notifyListeners();
        return true;
      } else {
        _errorMessage = "Login failed. Please check your credentials.";
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = "Failed to login. Please check your credentials.";
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    _authData = null;
    await _clearAuthData();
    notifyListeners();
  }

  Future<void> _saveAuthData() async {
    if (_authData == null) return;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, _authData!.token);
    await prefs.setString(_userIdKey, _authData!.userId);
    await prefs.setString(_emailKey, _authData!.email);
    await prefs.setString(_roleKey, _authData!.role);
    await prefs.setString(_expiryDateKey, _authData!.expiryDate.toIso8601String());
    SharedPreferencesProvider().setAuthenticated(true);
  }

  Future<void> _clearAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userIdKey);
    await prefs.remove(_emailKey);
    await prefs.remove(_roleKey);
    await prefs.remove(_expiryDateKey);
    SharedPreferencesProvider().setAuthenticated(false);
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Check if we have the token (as a basic check for stored auth data)
    if (!prefs.containsKey(_tokenKey)) return false;

    try {
      final token = prefs.getString(_tokenKey);
      final userId = prefs.getString(_userIdKey);
      final email = prefs.getString(_emailKey);
      final role = prefs.getString(_roleKey);
      final expiryDateStr = prefs.getString(_expiryDateKey);

      if (token == null || userId == null || email == null || 
          role == null || expiryDateStr == null) {
        await _clearAuthData();
        return false;
      }

      final expiryDate = DateTime.parse(expiryDateStr);
      if (expiryDate.isBefore(DateTime.now())) {
        await _clearAuthData();
        return false;
      }

      _authData = AuthData(
        token: token,
        userId: userId,
        email: email,
        role: role,
        expiryDate: expiryDate,
      );
      
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
