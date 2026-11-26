import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_companion/models/attendance_record.dart';
import 'package:school_companion/models/grade_record.dart';
import 'package:school_companion/models/student_model.dart';
import 'package:school_companion/repositories/school_repository_impl.dart';

final studentProfileProvider = FutureProvider.family<StudentModel, String>(
      (ref, studentId) async {
    return await ref.watch(schoolRepositoryProvider).getStudentProfile(studentId);
  },
  retry: (retryCount, error) => null,
);

final studentAttendanceProvider = FutureProvider.family<AttendanceRecord, String>(
      (ref, studentId) async {
    return await ref.watch(schoolRepositoryProvider).getStudentAttendance(studentId);
  },
  retry: (retryCount, error) => null,
);

final studentGradesProvider = FutureProvider.family<List<GradeRecord>, String>(
      (ref, studentId) async {
    return await ref.watch(schoolRepositoryProvider).getStudentGrades(studentId);
  },
  retry: (retryCount, error) => null,
);