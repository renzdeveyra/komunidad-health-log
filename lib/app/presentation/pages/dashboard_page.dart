import 'package:flutter/material.dart';
import 'login_page.dart';
import 'placeholder_page.dart';

// Import models
import '../../../app/domain/models/dashboard_stats.dart';
import '../../../app/domain/models/notification_item.dart';
import '../../../app/domain/models/appointment.dart';

// Import widgets
import '../widgets/dashboard/quick_stats_card.dart';
import '../widgets/dashboard/notifications_panel.dart';
import '../widgets/dashboard/mini_calendar.dart';
import '../widgets/common/sync_status_indicator.dart';

// Import constants
import '../../../core/constants/navigation_destinations.dart';
import '../../../core/constants/theme_constants.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = '/dashboard';

  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // Sample data for development/testing
  late DashboardStats _stats;
  late List<NotificationItem> _notifications;
  late List<Appointment> _appointments;
  late DateTime _selectedDate;
  late SyncStatus _syncStatus;
  late DateTime? _lastSyncTime;

  // Navigation state
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    // Initialize with sample data
    _stats = DashboardStats.sample();
    _notifications = NotificationItem.getSampleNotifications();
    _appointments = Appointment.getSampleAppointments();
    _selectedDate = DateTime.now();
    _syncStatus = SyncStatus.synced;
    _lastSyncTime = DateTime.now().subtract(const Duration(hours: 2));
  }

  // Build method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Komunidad Health Log'),
        actions: [
          // Sync status indicator
          SyncStatusIndicator(
            status: _syncStatus,
            lastSyncTime: _lastSyncTime,
            onTap: _handleSyncTap,
          ),
          // Profile/settings button
          IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'Profile',
            onPressed: _handleProfileTap,
          ),
          // Logout button
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: _handleLogout,
          ),
        ],
      ),
      body: _buildMainContent(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _handleAddButtonPressed,
        tooltip: 'Add New',
        icon: const Icon(Icons.add),
        label: Text(_getAddButtonTitle()),
        elevation: 4,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onDestinationSelected,
          destinations: NavigationDestinations.getNavigationDestinations(),
          elevation: 0,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Theme.of(context).colorScheme.surface,
          indicatorColor: Theme.of(context).colorScheme.secondaryContainer,
          height: 65,
        ),
      ),
    );
  }

  Widget _buildWelcomeSection(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ThemeConstants.primaryColor,
            ThemeConstants.primaryDarkColor,
          ],
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Use different layouts based on available width
          if (constraints.maxWidth > 500) {
            // Wide layout - Row with spaceBetween
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome, Midwife Maria',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Barangay: San Isidro',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white.withAlpha(230),
                      ),
                    ),
                  ],
                ),
                // Today's date
                Card(
                  elevation: 0,
                  color: Colors.white.withAlpha(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      _formatDate(_selectedDate),
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            // Narrow layout - Column with center alignment
            return Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome, Midwife Maria',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Barangay: San Isidro',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white.withAlpha(230),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Today's date
                Card(
                  elevation: 0,
                  color: Colors.white.withAlpha(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      _formatDate(_selectedDate),
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: QuickStatsCard(stats: _stats),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: NotificationsPanel(
                notifications: _notifications,
                onNotificationTap: _handleNotificationTap,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: MiniCalendar(
                selectedDate: _selectedDate,
                highlightedDates: _getHighlightedDates(),
                onDateSelected: _handleDateSelected,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: QuickStatsCard(stats: _stats),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: NotificationsPanel(
              notifications: _notifications,
              onNotificationTap: _handleNotificationTap,
            ),
          ),
          MiniCalendar(
            selectedDate: _selectedDate,
            highlightedDates: _getHighlightedDates(),
            onDateSelected: _handleDateSelected,
          ),
        ],
      ),
    );
  }

  // Get dates that should be highlighted in the calendar (appointments)
  List<DateTime> _getHighlightedDates() {
    return _appointments
        .map(
          (appointment) => DateTime(
            appointment.dateTime.year,
            appointment.dateTime.month,
            appointment.dateTime.day,
          ),
        )
        .toList();
  }

  // Format date for display
  String _formatDate(DateTime date) {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  // Handle refresh action
  Future<void> _handleRefresh() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // In a real app, this would fetch fresh data from the repository
    if (mounted) {
      setState(() {
        // Refresh data
        _stats = DashboardStats.sample();
        _notifications = NotificationItem.getSampleNotifications();
        _appointments = Appointment.getSampleAppointments();
        _syncStatus = SyncStatus.synced;
        _lastSyncTime = DateTime.now();
      });
    }
  }

  // Handle sync button tap
  void _handleSyncTap() {
    // Show sync dialog or start sync process
    setState(() {
      _syncStatus = SyncStatus.syncing;
    });

    // Simulate sync process
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _syncStatus = SyncStatus.synced;
          _lastSyncTime = DateTime.now();
        });

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data synchronized successfully')),
        );
      }
    });
  }

  // Handle profile button tap
  void _handleProfileTap() {
    // Navigate to profile/settings page
    _navigateToPlaceholder('Profile', Icons.account_circle);
  }

  // Handle logout button tap
  void _handleLogout() {
    // Show confirmation dialog
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirm Logout'),
            content: const Text('Are you sure you want to log out?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Perform logout and navigate to login page
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
                child: const Text('Logout'),
              ),
            ],
          ),
    );
  }

  // Handle notification tap
  void _handleNotificationTap(NotificationItem notification) {
    // Navigate to relevant screen based on notification type
    String title;
    IconData icon;

    switch (notification.type) {
      case NotificationType.appointment:
        title = 'Appointments';
        icon = Icons.calendar_today;
        break;
      case NotificationType.report:
        title = 'Reports';
        icon = Icons.description;
        break;
      case NotificationType.sync:
        title = 'Sync Status';
        icon = Icons.sync;
        break;
      case NotificationType.alert:
        title = 'Alerts';
        icon = Icons.warning_amber;
        break;
    }

    _navigateToPlaceholder(title, icon);
  }

  // Handle date selection in calendar
  void _handleDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
    });

    // Show appointments for selected date
    _navigateToPlaceholder(
      'Appointments for ${_formatDate(date)}',
      Icons.calendar_today,
    );
  }

  // Handle navigation destination selection
  void _onDestinationSelected(int index) {
    // If already on the selected index, don't do anything
    if (_selectedIndex == index) return;

    setState(() {
      _selectedIndex = index;
    });

    // Navigate to selected section
    switch (index) {
      case 0: // Dashboard
        // Already on dashboard, no navigation needed
        break;
      case 1: // Households
        _navigateToPlaceholder('Households', Icons.people);
        break;
      case 2: // Consultations
        _navigateToPlaceholder('Consultations', Icons.medical_services);
        break;
      case 3: // Reports
        _navigateToPlaceholder('Reports', Icons.summarize);
        break;
      case 4: // Analytics
        _navigateToPlaceholder('Analytics', Icons.analytics);
        break;
    }
  }

  // Build the main content area
  Widget _buildMainContent() {
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeSection(context),

            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 900) {
                  return _buildWideLayout(context);
                } else {
                  return _buildNarrowLayout(context);
                }
              },
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // Navigate to a placeholder page
  void _navigateToPlaceholder(String title, IconData icon) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PlaceholderPage(title: title, icon: icon),
      ),
    );
  }

  // Handle add button press
  void _handleAddButtonPressed() {
    // Show a modal bottom sheet with options based on current section
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.add_circle),
                title: Text('Add New ${_getAddButtonTitle()}'),
                onTap: () {
                  Navigator.pop(context);
                  _navigateToPlaceholder(
                    'Add ${_getAddButtonTitle()}',
                    _getAddButtonIcon(),
                  );
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.upload_file),
                title: const Text('Import Data'),
                onTap: () {
                  Navigator.pop(context);
                  _navigateToPlaceholder('Import Data', Icons.upload_file);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Get the appropriate title for the add button based on current section
  String _getAddButtonTitle() {
    switch (_selectedIndex) {
      case 0: // Dashboard
        return 'Record';
      case 1: // Households
        return 'Household';
      case 2: // Consultations
        return 'Consultation';
      case 3: // Reports
        return 'Report';
      case 4: // Analytics
        return 'Chart';
      default:
        return 'Item';
    }
  }

  // Get the appropriate icon for the add button based on current section
  IconData _getAddButtonIcon() {
    switch (_selectedIndex) {
      case 0: // Dashboard
        return Icons.note_add;
      case 1: // Households
        return Icons.home;
      case 2: // Consultations
        return Icons.medical_services;
      case 3: // Reports
        return Icons.summarize;
      case 4: // Analytics
        return Icons.insert_chart;
      default:
        return Icons.add;
    }
  }
}
