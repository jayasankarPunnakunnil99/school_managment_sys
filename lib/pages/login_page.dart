import 'package:flutter/material.dart';
import '../pages/preferences_debug_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Simulate login success
            final loginSuccess = true;

            if (loginSuccess) {
              Navigator.of(context).pushReplacementNamed(PreferencesDebugPage.routeName);
            }
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
} 