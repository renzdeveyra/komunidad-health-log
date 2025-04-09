import 'package:flutter/material.dart';
import '../../../../core/constants/dashboard_constants.dart';

/// Widget that displays the main navigation buttons on the dashboard
class NavigationButtons extends StatelessWidget {
  final Function(int)? onNavigate;
  
  const NavigationButtons({
    super.key,
    this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Use a row for wider screens, column for narrower screens
          if (constraints.maxWidth > 600) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _buildNavigationButtons(context),
            );
          } else {
            return Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 16.0,
              runSpacing: 16.0,
              children: _buildNavigationButtons(context),
            );
          }
        },
      ),
    );
  }
  
  List<Widget> _buildNavigationButtons(BuildContext context) {
    final theme = Theme.of(context);
    
    final buttons = [
      _buildNavigationButton(
        context,
        DashboardConstants.households,
        DashboardConstants.householdIcon,
        0,
        theme.colorScheme.primary,
      ),
      _buildNavigationButton(
        context,
        DashboardConstants.consultations,
        DashboardConstants.consultationsIcon,
        1,
        theme.colorScheme.secondary,
      ),
      _buildNavigationButton(
        context,
        DashboardConstants.reports,
        DashboardConstants.reportsIcon,
        2,
        Colors.green,
      ),
      _buildNavigationButton(
        context,
        DashboardConstants.analytics,
        DashboardConstants.analyticsIcon,
        3,
        Colors.purple,
      ),
    ];
    
    return buttons;
  }
  
  Widget _buildNavigationButton(
    BuildContext context,
    String label,
    IconData icon,
    int index,
    Color color,
  ) {
    final theme = Theme.of(context);
    
    return ElevatedButton(
      onPressed: () {
        if (onNavigate != null) {
          onNavigate!(index);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 32),
          const SizedBox(height: 8),
          Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
