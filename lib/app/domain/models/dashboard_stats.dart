/// Model class for dashboard statistics
class DashboardStats {
  final int householdCount;
  final int pregnantWomenCount;
  final int childrenUnderOneCount;
  final int dueForVaccinesCount;
  
  const DashboardStats({
    required this.householdCount,
    required this.pregnantWomenCount,
    required this.childrenUnderOneCount,
    required this.dueForVaccinesCount,
  });
  
  // Sample data for development/testing
  factory DashboardStats.sample() {
    return const DashboardStats(
      householdCount: 245,
      pregnantWomenCount: 18,
      childrenUnderOneCount: 32,
      dueForVaccinesCount: 8,
    );
  }
}
