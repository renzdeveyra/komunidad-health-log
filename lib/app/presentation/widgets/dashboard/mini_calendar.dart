import 'package:flutter/material.dart';
import '../../../../core/constants/dashboard_constants.dart';

/// Widget that displays a mini calendar on the dashboard
class MiniCalendar extends StatelessWidget {
  final DateTime selectedDate;
  final List<DateTime> highlightedDates;
  final Function(DateTime)? onDateSelected;
  
  const MiniCalendar({
    super.key,
    required this.selectedDate,
    this.highlightedDates = const [],
    this.onDateSelected,
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
              DashboardConstants.calendar,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildCalendarHeader(context),
            const SizedBox(height: 8),
            _buildCalendarGrid(context),
            const SizedBox(height: 8),
            if (highlightedDates.isNotEmpty)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // TODO: Navigate to full calendar view
                  },
                  child: const Text('View Full Calendar'),
                ),
              ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildCalendarHeader(BuildContext context) {
    final theme = Theme.of(context);
    final daysOfWeek = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate the width for each day based on available width
        final dayWidth = (constraints.maxWidth / 7).floor().toDouble();
        
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: daysOfWeek.map((day) {
            return SizedBox(
              width: dayWidth,
              child: Text(
                day,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
  
  Widget _buildCalendarGrid(BuildContext context) {
    final theme = Theme.of(context);
    final today = DateTime.now();
    final firstDayOfMonth = DateTime(selectedDate.year, selectedDate.month, 1);
    
    // Calculate the first day to display (may be from previous month)
    final firstDayToDisplay = firstDayOfMonth.subtract(Duration(days: firstDayOfMonth.weekday % 7));
    
    // Calculate total days to display (up to 6 weeks)
    final daysToDisplay = List.generate(42, (index) {
      return firstDayToDisplay.add(Duration(days: index));
    });
    
    // Group days into weeks
    final weeks = <List<DateTime>>[];
    for (var i = 0; i < daysToDisplay.length; i += 7) {
      weeks.add(daysToDisplay.sublist(i, i + 7));
    }
    
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate the width and height for each day based on available width
        final dayWidth = (constraints.maxWidth / 7).floor().toDouble();
        final dayHeight = dayWidth; // Keep it square
        
        return Column(
          children: weeks.take(5).map((week) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: week.map((date) {
                final isCurrentMonth = date.month == selectedDate.month;
                final isToday = date.year == today.year && date.month == today.month && date.day == today.day;
                final isSelected = date.year == selectedDate.year && date.month == selectedDate.month && date.day == selectedDate.day;
                final isHighlighted = highlightedDates.any((d) => d.year == date.year && d.month == date.month && d.day == date.day);
                
                return InkWell(
                  onTap: () {
                    if (onDateSelected != null) {
                      onDateSelected!(date);
                    }
                  },
                  borderRadius: BorderRadius.circular(dayWidth / 2), // Make it circular
                  child: Container(
                    width: dayWidth,
                    height: dayHeight,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? theme.colorScheme.primary
                          : isToday
                              ? theme.colorScheme.primaryContainer
                              : isHighlighted
                                  ? theme.colorScheme.secondary.withAlpha(76) // 0.3 opacity
                                  : Colors.transparent,
                    ),
                    child: Text(
                      date.day.toString(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: isSelected
                            ? Colors.white
                            : !isCurrentMonth
                                ? Colors.grey
                                : isToday
                                    ? theme.colorScheme.primary
                                    : null,
                        fontWeight: isToday || isSelected || isHighlighted ? FontWeight.bold : null,
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }).toList(),
        );
      },
    );
  }
}
