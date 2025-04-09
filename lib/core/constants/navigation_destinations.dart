import 'package:flutter/material.dart';

/// Navigation destinations for the app
class NavigationDestinations {
  /// Get the list of navigation destinations
  static List<NavigationDestination> getNavigationDestinations() {
    return [
      const NavigationDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: 'Dashboard',
      ),
      const NavigationDestination(
        icon: Icon(Icons.people_outline),
        selectedIcon: Icon(Icons.people),
        label: 'Households',
      ),
      const NavigationDestination(
        icon: Icon(Icons.medical_services_outlined),
        selectedIcon: Icon(Icons.medical_services),
        label: 'Consultations',
      ),
      const NavigationDestination(
        icon: Icon(Icons.summarize_outlined),
        selectedIcon: Icon(Icons.summarize),
        label: 'Reports',
      ),
      const NavigationDestination(
        icon: Icon(Icons.analytics_outlined),
        selectedIcon: Icon(Icons.analytics),
        label: 'Analytics',
      ),
    ];
  }

  /// Get the list of navigation rail destinations
  static List<NavigationRailDestination> getNavigationRailDestinations() {
    return [
      const NavigationRailDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: Text('Dashboard'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.people_outline),
        selectedIcon: Icon(Icons.people),
        label: Text('Households'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.medical_services_outlined),
        selectedIcon: Icon(Icons.medical_services),
        label: Text('Consultations'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.summarize_outlined),
        selectedIcon: Icon(Icons.summarize),
        label: Text('Reports'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.analytics_outlined),
        selectedIcon: Icon(Icons.analytics),
        label: Text('Analytics'),
      ),
    ];
  }
  
  /// Get the destination names
  static List<String> getDestinationLabels() {
    return [
      'Dashboard',
      'Households',
      'Consultations',
      'Reports',
      'Analytics',
    ];
  }
}
