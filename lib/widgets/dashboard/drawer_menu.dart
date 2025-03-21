import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final String userRole;

  const DrawerMenu({
    super.key,
    required this.userRole,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 35),
              ),
              SizedBox(height: 10),
              Text(
                'School Management',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        _buildMenuItems(context),
      ],
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    final List<DrawerItem> menuItems = _getMenuItemsByRole();

    return Column(
      children: menuItems.map((item) {
        return ListTile(
          leading: Icon(item.icon),
          title: Text(item.title),
          onTap: () {
            Navigator.pop(context); // Close drawer
            if (item.route != null) {
              Navigator.pushNamed(context, item.route!);
            }
          },
        );
      }).toList(),
    );
  }

  List<DrawerItem> _getMenuItemsByRole() {
    final List<DrawerItem> menuItems = [
      const DrawerItem(
        title: 'Dashboard',
        icon: Icons.dashboard,
      ),
    ];

    switch (userRole) {
      case 'super_admin':
        menuItems.addAll([
          const DrawerItem(
            title: 'Students',
            icon: Icons.school,
            route: '/students',
          ),
          const DrawerItem(
            title: 'Teachers',
            icon: Icons.person,
            route: '/teachers',
          ),
          const DrawerItem(
            title: 'Staff',
            icon: Icons.group,
            route: '/staff',
          ),
          const DrawerItem(
            title: 'Attendance',
            icon: Icons.calendar_today,
            route: '/attendance',
          ),
          const DrawerItem(
            title: 'Fee Management',
            icon: Icons.payment,
            route: '/fees',
          ),
          const DrawerItem(
            title: 'Reports',
            icon: Icons.assessment,
            route: '/reports',
          ),
          const DrawerItem(
            title: 'Settings',
            icon: Icons.settings,
            route: '/settings',
          ),
        ]);
        break;
      // Add cases for other roles
    }

    return menuItems;
  }
}

class DrawerItem {
  final String title;
  final IconData icon;
  final String? route;

  const DrawerItem({
    required this.title,
    required this.icon,
    this.route,
  });
} 