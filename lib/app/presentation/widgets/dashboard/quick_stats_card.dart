import 'package:flutter/material.dart';
import '../../../../core/constants/dashboard_constants.dart';
import '../../../domain/models/dashboard_stats.dart';

/// Widget that displays quick statistics on the dashboard
class QuickStatsCard extends StatelessWidget {
  final DashboardStats stats;
  
  const QuickStatsCard({
    super.key,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DashboardConstants.quickStats,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildStatRow(
              context,
              DashboardConstants.householdsLabel,
              stats.householdCount.toString(),
              Icons.home,
              theme.colorScheme.primary,
            ),
            const Divider(height: 24),
            _buildStatRow(
              context,
              DashboardConstants.pregnantWomenLabel,
              stats.pregnantWomenCount.toString(),
              Icons.pregnant_woman,
              Colors.pink,
            ),
            const Divider(height: 24),
            _buildStatRow(
              context,
              DashboardConstants.childrenUnderOneLabel,
              stats.childrenUnderOneCount.toString(),
              Icons.child_care,
              Colors.orange,
            ),
            const Divider(height: 24),
            _buildStatRow(
              context,
              DashboardConstants.dueForVaccinesLabel,
              stats.dueForVaccinesCount.toString(),
              Icons.vaccines,
              Colors.green,
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildStatRow(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    final theme = Theme.of(context);
    
    return Row(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.bodyLarge,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
