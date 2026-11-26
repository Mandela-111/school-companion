import 'attendance_status.dart';

class AttendanceRecord {
  final String id;
  final String studentId;
  final String date;
  final AttendanceStatus status;

  AttendanceRecord({
    required this.id,
    required this.studentId,
    required this.date,
    required this.status,
  });

  factory AttendanceRecord.fromJson(Map<String, dynamic> json) {
    return AttendanceRecord(
      id: json['id'] ?? '',
      studentId: json['student_id'] ?? '',
      date: json['date'] ?? '',
      status: AttendanceStatus.values.firstWhere(
            (s) => s.name == (json['status'] ?? 'present'),
        orElse: () => AttendanceStatus.present,
      ),
    );
  }
}