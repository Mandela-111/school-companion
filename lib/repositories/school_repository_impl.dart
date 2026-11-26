import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_companion/data/dio_provider.dart';
import 'package:school_companion/models/attendance_record.dart';
import 'package:school_companion/models/grade_record.dart';
import 'package:school_companion/models/student_model.dart';
import 'package:school_companion/repositories/school_repository.dart';
import 'package:school_companion/services/school_service.dart';

final schoolServiceProvider = Provider<SchoolService>((ref) {
  final dio = ref.watch(dioProvider);
  return SchoolService(dio);
});

class SchoolRepositoryImpl implements SchoolRepository {
  final SchoolService _schoolService;

  SchoolRepositoryImpl(this._schoolService);

  @override
  Future<StudentModel> getStudentProfile(String studentId) {
    return _schoolService.getStudentProfile(studentId);
  }

  @override
  Future<AttendanceRecord> getStudentAttendance(String studentId) {
    return _schoolService.getStudentAttendance(studentId);
  }

  @override
  Future<List<GradeRecord>> getStudentGrades(String studentId) {
    return _schoolService.getStudentGrades(studentId);
  }

  @override
  Future<void> submitAttendance(List<AttendanceRecord> records) {
    return _schoolService.submitAttendance(records);
  }
}

final schoolRepositoryProvider = Provider<SchoolRepository>((ref) {
  final schoolService = ref.watch(schoolServiceProvider);
  return SchoolRepositoryImpl(schoolService);
});