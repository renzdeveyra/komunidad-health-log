import 'package:flutter/material.dart';

/// Model class for appointments
class Appointment {
  final String id;
  final String patientName;
  final DateTime dateTime;
  final AppointmentType type;
  final String notes;
  
  const Appointment({
    required this.id,
    required this.patientName,
    required this.dateTime,
    required this.type,
    this.notes = '',
  });
  
  // Sample data for development/testing
  static List<Appointment> getSampleAppointments() {
    final now = DateTime.now();
    
    return [
      Appointment(
        id: '1',
        patientName: 'Maria Santos',
        dateTime: DateTime(now.year, now.month, now.day, 9, 0),
        type: AppointmentType.prenatal,
        notes: 'Third trimester check-up',
      ),
      Appointment(
        id: '2',
        patientName: 'Ana Cruz',
        dateTime: DateTime(now.year, now.month, now.day, 10, 30),
        type: AppointmentType.immunization,
        notes: 'Penta 3, OPV 3',
      ),
      Appointment(
        id: '3',
        patientName: 'Elena Reyes',
        dateTime: DateTime(now.year, now.month, now.day + 1, 14, 0),
        type: AppointmentType.familyPlanning,
        notes: 'DMPA injection',
      ),
      Appointment(
        id: '4',
        patientName: 'Juan Dela Cruz',
        dateTime: DateTime(now.year, now.month, now.day + 2, 11, 0),
        type: AppointmentType.ncd,
        notes: 'Hypertension follow-up',
      ),
    ];
  }
  
  // Get icon based on appointment type
  IconData get icon {
    switch (type) {
      case AppointmentType.prenatal:
        return Icons.pregnant_woman;
      case AppointmentType.postnatal:
        return Icons.baby_changing_station;
      case AppointmentType.immunization:
        return Icons.vaccines;
      case AppointmentType.familyPlanning:
        return Icons.family_restroom;
      case AppointmentType.ncd:
        return Icons.monitor_heart;
      case AppointmentType.general:
        return Icons.medical_services;
    }
  }
  
  // Get color based on appointment type
  Color get color {
    switch (type) {
      case AppointmentType.prenatal:
        return Colors.pink;
      case AppointmentType.postnatal:
        return Colors.purple;
      case AppointmentType.immunization:
        return Colors.green;
      case AppointmentType.familyPlanning:
        return Colors.blue;
      case AppointmentType.ncd:
        return Colors.orange;
      case AppointmentType.general:
        return Colors.teal;
    }
  }
  
  // Get type name
  String get typeName {
    switch (type) {
      case AppointmentType.prenatal:
        return 'Prenatal';
      case AppointmentType.postnatal:
        return 'Postnatal';
      case AppointmentType.immunization:
        return 'Immunization';
      case AppointmentType.familyPlanning:
        return 'Family Planning';
      case AppointmentType.ncd:
        return 'NCD';
      case AppointmentType.general:
        return 'General';
    }
  }
}

/// Types of appointments
enum AppointmentType {
  prenatal,
  postnatal,
  immunization,
  familyPlanning,
  ncd,
  general,
}
