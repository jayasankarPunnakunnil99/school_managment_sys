import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management_system/providers/auth_provider.dart';
import 'package:school_management_system/providers/theme_provider.dart';
import 'package:school_management_system/routes/app_routes.dart';
import '../../constants/app_styles.dart';

class DashboardLayout extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final List<Widget>? actions;
  final String userRole;

  const DashboardLayout({
    super.key,
    required this.title,
    required this.children,
    required this.userRole,
    this.actions,
  });
  
  get isDarkMode => ThemeProvider().isDarkMode;

  List<DrawerMenuItem> _getMenuItemsByRole() {
    switch (userRole.toLowerCase()) {
      case 'admin':
        return [
          DrawerMenuItem(
            icon: Icons.calendar_month,
            title: 'Upcoming Events',
            route: '/events',
          ),
          DrawerMenuItem(
            icon: Icons.notifications,
            title: 'Send Notifications',
            route: '/notifications',
          ),
          DrawerMenuItem(
            icon: Icons.class_,
            title: 'Manage Classes & Subjects',
            route: '/classes',
          ),
          DrawerMenuItem(
            icon: Icons.announcement,
            title: 'Announcements & Notices',
            route: '/announcements',
          ),
          DrawerMenuItem(
            icon: Icons.settings,
            title: 'School Settings',
            route: '/settings',
          ),
        ];
      case 'teacher':
        return [
          DrawerMenuItem(
            icon: Icons.dashboard,
            title: 'Dashboard',
            route: '/teacher-dashboard',
          ),
          DrawerMenuItem(
            icon: Icons.class_,
            title: 'My Classes',
            route: '/my-classes',
          ),
          DrawerMenuItem(
            icon: Icons.assessment,
            title: 'Student Performance',
            route: '/student-performance',
          ),
          DrawerMenuItem(
            icon: Icons.calendar_month,
            title: 'Upcoming Events',
            route: '/events',
          ),
          DrawerMenuItem(
            icon: Icons.people,
            title: 'Attendance Summary',
            route: '/attendance',
          ),
          DrawerMenuItem(
            icon: Icons.announcement,
            title: 'Announcements & Notices',
            route: '/announcements',
          ),
          DrawerMenuItem(
            icon: Icons.schedule,
            title: 'My Schedule',
            route: '/schedule',
          ),
        ];
      case 'student':
        return [
          DrawerMenuItem(
            icon: Icons.dashboard,
            title: 'Dashboard',
            route: '/student-dashboard',
          ),
          DrawerMenuItem(
            icon: Icons.schedule,
            title: 'Class Schedule',
            route: '/schedule',
          ),
          DrawerMenuItem(
            icon: Icons.assessment,
            title: 'My Performance',
            route: '/my-performance',
          ),
          DrawerMenuItem(
            icon: Icons.calendar_month,
            title: 'Upcoming Events',
            route: '/events',
          ),
          DrawerMenuItem(
            icon: Icons.holiday_village,
            title: 'Holidays',
            route: '/holidays',
          ),
          DrawerMenuItem(
            icon: Icons.announcement,
            title: 'Announcements & Notices',
            route: '/announcements',
          ),
          DrawerMenuItem(
            icon: Icons.assignment,
            title: 'Assignments',
            route: '/assignments',
          ),
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final menuItems = _getMenuItemsByRole();
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(title), actions: actions, elevation: 0),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 240,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 45, color: Colors.blue),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Hi, Jayasankar',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        userRole.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                children:
                    menuItems
                        .map(
                          (item) => ListTile(
                            leading: Icon(
                              item.icon,
                              color: Theme.of(context).primaryColor,
                              size: 26,
                            ),
                            title: Text(
                              item.title,
                              style: AppStyles.subheadingStyle().copyWith(
                                color: Colors.grey[800],
                                fontSize: 15,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, item.route);
                            },
                            dense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 8.0,
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
            ListTile(
              leading: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
              title: const Text('Dark Mode'),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  context.read<ThemeProvider>().toggleTheme();
                },
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: Text(
                'Logout',
                style: AppStyles.subheadingStyle().copyWith(color: Colors.red),
              ),
              onTap: () async {
                await authProvider.logout();
                if (context.mounted) {
                  Navigator.pushReplacementNamed(context, AppRoutes.login);
                }
              },
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 0.0,
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppStyles.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}

class DrawerMenuItem {
  final IconData icon;
  final String title;
  final String route;

  const DrawerMenuItem({
    required this.icon,
    required this.title,
    required this.route,
  });
}
