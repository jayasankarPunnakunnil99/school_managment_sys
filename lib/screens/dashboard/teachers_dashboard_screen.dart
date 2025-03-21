import 'package:flutter/material.dart';
import '../../widgets/dashboard/dashboard_layout.dart';
import '../../widgets/dashboard/stat_card.dart';
import '../../constants/app_styles.dart';

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({super.key});

  final List<StatCard> statCards = const [
  StatCard(
    title: 'Total\nStudents',
    value: '40',
    icon: Icons.school,
    color: Colors.blue,
  ),
  StatCard(
    title: 'Attendance',
    value: '75',
    icon: Icons.person,
    color: Colors.green,
  ),
  StatCard(
    title: 'Assigned\nClasses',
    value: '45',
    icon: Icons.group,
    color: Colors.orange,
  ),
  StatCard(
    title: 'Upcoming\nSchedules',
    value: '\$52,000',
    icon: Icons.attach_money,
    color: Colors.purple,
  )
];

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      title: 'Teachers Dashboard',
      children: [
        Text(
          'Overview',
          style: AppStyles.headingStyle,
        ),
        const SizedBox(height: 20),
        GridView.count(
          crossAxisCount: statCards.length == 1 ? 1 : (MediaQuery.of(context).size.width > 1200 ? 4 : 2),
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          shrinkWrap: true,
          childAspectRatio: 1.0,
          physics: const NeverScrollableScrollPhysics(),
          children: statCards,
        ),
        const SizedBox(height: 32),
        _buildQuickActions(context),
        const SizedBox(height: 32),
        _buildRecentActivities(),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: AppStyles.subheadingStyle,
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildActionButton(
              context,
              title: 'Mark Attendance',
              icon: Icons.person_add,
              onPressed: () {
                // TODO: Navigate to add student screen
              },
            ),
            _buildActionButton(
              context,
              title: 'Timetable',
              icon: Icons.group_add,
              onPressed: () {
                // TODO: Navigate to add teacher screen
              },
            ),
            _buildActionButton(
              context,
              title: 'Assign Homework/Notes',
              icon: Icons.payment,
              onPressed: () {
                // TODO: Navigate to fee collection screen
              },
            ),
            _buildActionButton(
              context,
              title: 'Performance',
              icon: Icons.assessment,
              onPressed: () {
                // TODO: Navigate to reports screen
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(title),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
      ),
    );
  }

  Widget _buildRecentActivities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Messages & Announcements',
          style: AppStyles.subheadingStyle,
        ),
        const SizedBox(height: 16),
        Card(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.notifications),
                ),
                title: Text('Activity ${index + 1}'),
                subtitle: Text('Description of activity ${index + 1}'),
                trailing: Text('${index + 1}h ago'),
              );
            },
          ),
        ),
      ],
    );
  }
} 