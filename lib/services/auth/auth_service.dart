import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:school_companion/models/user_model.dart';
import 'package:school_companion/models/user_role.dart';

class AuthService {
  final FlutterSecureStorage _storage;
  static const String _tokenKey = 'auth_token';
  static const String _roleKey = 'user_role';


  // in square brackets means it's optional. Kinda dependency injection y'know.
  // If we wanna
  AuthService([FlutterSecureStorage? storage])
      : _storage = storage ?? const FlutterSecureStorage();

  Future<String?> checkToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<UserRole> getUserRole() async {
    final roleString = await _storage.read(key: _roleKey);
    if (roleString == 'teacher') return UserRole.teacher;
    return UserRole.parent;
  }

  Future<UserModel> login(String email, String password, UserRole role) async {
    const String token = "school_persisted_token_888";

    await _storage.write(key: _tokenKey, value: token);
    await _storage.write(key: _roleKey, value: role.name);

    return UserModel(
      id: 'usr_123',
      name: role == UserRole.teacher ? 'Mrs. Sarah Jenkins' : 'Mr. John Doe',
      email: email,
      role: role,
    );
  }

  Future<void> logout() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _roleKey);
  }
}