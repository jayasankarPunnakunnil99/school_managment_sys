import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management_system/routes/app_routes.dart';
import '../providers/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesDebugPage extends StatefulWidget {
  static const routeName = '/preferences-debug';

  const PreferencesDebugPage({Key? key}) : super(key: key);

  @override
  State<PreferencesDebugPage> createState() => _PreferencesDebugPageState();
}

class _PreferencesDebugPageState extends State<PreferencesDebugPage> {
  Map<String, String> _prefsData = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _prefsData = {
        'auth_token': prefs.getString('auth_token') ?? 'Not found',
        'auth_user_id': prefs.getString('auth_user_id') ?? 'Not found',
        'auth_email': prefs.getString('auth_email') ?? 'Not found',
        'auth_role': prefs.getString('auth_role') ?? 'Not found',
        'auth_expiry_date': prefs.getString('auth_expiry_date') ?? 'Not found',
      };
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stored Preferences'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _isLoading = true;
              });
              _loadPreferences();
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  const SizedBox(height: 16),
                  const Text(
                    'Stored Preferences:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ..._prefsData.entries.map(
                    (entry) => Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.key,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              entry.value,
                              style: const TextStyle(
                                fontFamily: 'monospace',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        await authProvider.logout();
                        if (context.mounted) {
                         Navigator.pushReplacementNamed(context, AppRoutes.login);
                        }
                      },
                      child: const Text('Logout'),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
} 