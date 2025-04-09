import 'package:flutter/material.dart';

/// Model class for notification items
class NotificationItem {
  final String message;
  final DateTime timestamp;
  final NotificationType type;
  final bool isRead;
  
  const NotificationItem({
    required this.message,
    required this.timestamp,
    required this.type,
    this.isRead = false,
  });
  
  // Sample data for development/testing
  static List<NotificationItem> getSampleNotifications() {
    return [
      NotificationItem(
        message: '5 prenatal visits due this week',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        type: NotificationType.appointment,
      ),
      NotificationItem(
        message: '2 reports pending submission',
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
        type: NotificationType.report,
      ),
      NotificationItem(
        message: 'Data sync needed',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        type: NotificationType.sync,
      ),
    ];
  }
  
  // Get icon based on notification type
  IconData get icon {
    switch (type) {
      case NotificationType.appointment:
        return Icons.calendar_today;
      case NotificationType.report:
        return Icons.description;
      case NotificationType.sync:
        return Icons.sync;
      case NotificationType.alert:
        return Icons.warning_amber;
    }
  }
  
  // Get color based on notification type
  Color get color {
    switch (type) {
      case NotificationType.appointment:
        return Colors.blue;
      case NotificationType.report:
        return Colors.orange;
      case NotificationType.sync:
        return Colors.purple;
      case NotificationType.alert:
        return Colors.red;
    }
  }
}

/// Types of notifications
enum NotificationType {
  appointment,
  report,
  sync,
  alert,
}
