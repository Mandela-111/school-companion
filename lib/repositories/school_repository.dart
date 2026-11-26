import 'package:school_companion/models/attendance_record.dart';
import 'package:school_companion/models/grade_record.dart';
import 'package:school_companion/models/student_model.dart';

abstract class SchoolRepository {
  Future<StudentModel> getStudentProfile(String studentId);
  Future<AttendanceRecord> getStudentAttendance(String studentId);
  Future<List<GradeRecord>> getStudentGrades(String studentId);
  Future<void> submitAttendance(List<AttendanceRecord> records);
}