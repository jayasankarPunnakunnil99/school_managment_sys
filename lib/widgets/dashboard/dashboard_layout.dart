import 'package:flutter/material.dart';
import '../../constants/app_styles.dart';

class DashboardLayout extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final List<Widget>? actions;

  const DashboardLayout({
    super.key,
    required this.title,
    required this.children,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: actions),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
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
                    'Hi, Jayasankar',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),

            // Add menu items based on role
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Row(
                  children: [
                     const SizedBox(width: 8),
                    Icon(Icons.calendar_month, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 8),
                    Text(
                      "Upcoming Events",
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: AppStyles.subheadingStyle.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                 Row(
                  children: [
                     const SizedBox(width: 8),
                    Icon(Icons.travel_explore, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 8),
                    Text(
                      "Holidays",
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: AppStyles.subheadingStyle.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),

                 Row(
                  children: [
                     const SizedBox(width: 8),
                    Icon(Icons.travel_explore, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 8),
                    Text(
                      "Send Notifications",
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: AppStyles.subheadingStyle.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),

                 Row(
                  children: [
                     const SizedBox(width: 8),
                    Icon(Icons.travel_explore, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 8),
                    Text(
                      "Manage Classes & Subjects",
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: AppStyles.subheadingStyle.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),

                 Row(
                  children: [
                     const SizedBox(width: 8),
                    Icon(Icons.travel_explore, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 8),
                    Text(
                      "Attendance Summary",
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: AppStyles.subheadingStyle.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),

                 Row(
                  children: [
                     const SizedBox(width: 8),
                    Icon(Icons.travel_explore, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 8),
                    Text(
                      "Announcements & Notices",
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: AppStyles.subheadingStyle.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
             
              ],
            ),
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
