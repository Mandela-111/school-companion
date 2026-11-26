import 'package:school_companion/models/user_role.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final UserRole role;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? 'User',
      email: json['email'] ?? '',
      role: UserRole.values.firstWhere(
        (r) => r.name == (json['role'] ?? 'parent'),
        orElse: () => UserRole.parent,
      ),
    );
  }
}
