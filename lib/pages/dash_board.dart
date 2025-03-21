import 'package:flutter/material.dart';
import 'package:school_management_system/screens/dashboard/student_dashboard_screen%20copy.dart';
import 'package:school_management_system/screens/dashboard/sub_admin_dashboard_screen.dart';
import 'package:school_management_system/screens/dashboard/super_admin_dashboard_screen.dart';
import 'package:school_management_system/screens/dashboard/teachers_dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {

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
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final role = _prefsData['auth_role']?.toLowerCase() ?? '';
    
    switch (role) {
      case 'super_admin':
        return const SuperAdminDashboard();
      case 'sub_admin':
        return const SubAdminDashboard();
      case 'teacher':
        return const TeacherDashboard();
      // case 'staff':
      //   return const staffDashboard();
      case 'student':
        return const StudentDashboard();
      default:
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Invalid or missing role',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                Text('Current role: $role'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isLoading = true;
                    });
                    _loadPreferences();
                  },
                  child: const Text('Refresh'),
                ),
              ],
            ),
          ),
        );
    }
  }
} 