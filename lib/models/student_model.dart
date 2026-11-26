class StudentModel {
  final String id;
  final String name;
  final String classId;
  final String parentId;

  StudentModel({
    required this.id,
    required this.name,
    required this.classId,
    required this.parentId,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Student',
      classId: json['class_id'] ?? '',
      parentId: json['parent_id'] ?? '',
    );
  }
}