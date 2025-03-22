import 'package:flutter/material.dart';
import 'package:school_management_system/providers/theme_provider.dart';
import '../../constants/app_styles.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final TextStyle? valueStyle;
  final VoidCallback? onTap;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.color,
    this.padding,
    this.valueStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(AppStyles.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: color ?? Theme.of(context).primaryColor),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    style: AppStyles.subheadingStyle(isDark:  ThemeProvider().isDarkMode).copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                value,
                style: valueStyle ?? const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}