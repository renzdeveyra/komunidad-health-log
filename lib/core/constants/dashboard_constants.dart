import 'package:flutter/material.dart';

/// Constants for the dashboard page
class DashboardConstants {
  // Navigation item labels
  static const String households = 'Households';
  static const String consultations = 'Consultations';
  static const String reports = 'Reports';
  static const String analytics = 'Analytics';
  
  // Navigation item icons
  static const IconData householdIcon = Icons.home_outlined;
  static const IconData consultationsIcon = Icons.medical_services_outlined;
  static const IconData reportsIcon = Icons.summarize_outlined;
  static const IconData analyticsIcon = Icons.analytics_outlined;
  
  // Dashboard section titles
  static const String quickStats = 'QUICK STATS';
  static const String notifications = 'Notifications';
  static const String calendar = 'CALENDAR';
  
  // Quick stats labels
  static const String householdsLabel = 'Households';
  static const String pregnantWomenLabel = 'Pregnant Women';
  static const String childrenUnderOneLabel = 'Children <1';
  static const String dueForVaccinesLabel = 'Due for Vaccines';
}
