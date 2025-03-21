import 'package:flutter/material.dart';
import 'package:school_management_system/pages/preferences_debug_page.dart';
import 'package:school_management_system/screens/dashboard/student_dashboard_screen%20copy.dart';
import 'package:school_management_system/screens/dashboard/super_admin_dashboard_screen.dart';
import 'package:school_management_system/screens/dashboard/teachers_dashboard_screen.dart';
import 'package:school_management_system/screens/staff/staff_list_screen.dart';
import 'package:school_management_system/screens/teacher/teacher_list_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/forgot_password_screen.dart';
import '../screens/dashboard/sub_admin_dashboard_screen.dart';
import '../screens/student/student_list_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String forgotPassword = '/forgot-password';
  static const String superAdminDashboard = '/super-admin-dashboard';
  static const String subAdminDashboard = '/sub-admin-dashboard';
  static const String teacherDashboard = '/teacher-dashboard';
  static const String staffDashboard = '/staff-dashboard';
  static const String studentDashboard = '/student-dashboard';
  static const String defaultPage = '/default';
  static const String students = '/students';
  static const String staff = '/staff';
  static const String teacher = '/teachers';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginScreen(),
    forgotPassword: (context) => const ForgotPasswordScreen(),
    superAdminDashboard: (context) => const SuperAdminDashboard(),
    subAdminDashboard: (context) => const SubAdminDashboard(),
    teacherDashboard: (context) => const TeacherDashboard(),
    // staffDashboard: (context) => const StaffDashboard(),
    studentDashboard: (context) => const StudentDashboard(),
    defaultPage: (context) => const PreferencesDebugPage(),
    students: (context) => const StudentListScreen(),
    staff: (context) => const StaffListScreen(),
    teacher: (context) => const TeacherListScreen(),
  };
} 