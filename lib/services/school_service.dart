import 'package:dio/dio.dart';
import 'package:school_companion/data/dio_provider.dart';
import 'package:school_companion/models/attendance_record.dart';
import 'package:school_companion/models/attendance_status.dart';
import 'package:school_companion/models/grade_record.dart';
import 'package:school_companion/models/student_model.dart';
import 'package:school_companion/core/utils/api_error_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



// we're not actually doing network calls here at all, we're only using MockData
// nkoaa throughout

class SchoolService {
  final Dio _dio;
  // 3no nti na it's highlighting s3 the variable '_dio' is not used no.

  SchoolService(this._dio);

  Future<StudentModel> getStudentProfile(String studentId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      return StudentModel(
        id: studentId,
        name: 'Alex Doe',
        classId: 'Grade 5A',
        parentId: 'usr_123',
      );
    } on DioException catch (e) {
      throw ApiErrorHandler.fromDioException(e);
    }
  }

  Future<AttendanceRecord> getStudentAttendance(String studentId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      return AttendanceRecord(
        id: 'att_001',
        studentId: studentId,
        date: '2026-11-10',
        status: AttendanceStatus.present,
      );
    } on DioException catch (e) {
      throw ApiErrorHandler.fromDioException(e);
    }
  }

  Future<List<GradeRecord>> getStudentGrades(String studentId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      return [
        GradeRecord(id: 'g1', studentId: studentId, subject: 'Mathematics', score: 92.0, maxScore: 100.0, term: 'Term 1'),
        GradeRecord(id: 'g2', studentId: studentId, subject: 'Science', score: 88.0, maxScore: 100.0, term: 'Term 1'),
        GradeRecord(id: 'g3', studentId: studentId, subject: 'English Language', score: 95.0, maxScore: 100.0, term: 'Term 1'),
      ];
    } on DioException catch (e) {
      throw ApiErrorHandler.fromDioException(e);
    }
  }

  Future<void> submitAttendance(List<AttendanceRecord> records) async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
    } on DioException catch (e) {
      throw ApiErrorHandler.fromDioException(e);
    }
  }
}

final schoolServiceProvider = Provider<SchoolService>((ref) {
  final dio = ref.watch(dioProvider);
  return SchoolService(dio);
});
