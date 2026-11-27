import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_companion/models/auth_status.dart';
import 'package:school_companion/models/user_role.dart';
import 'package:school_companion/services/auth/auth_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

class UserRoleNotifier extends Notifier<UserRole?> {
  @override
  UserRole? build() => null;

  void setRole(UserRole? role) {
    state = role;
  }
}

final userRoleProvider = NotifierProvider<UserRoleNotifier, UserRole?>(
  UserRoleNotifier.new,
);

class AuthNotifier extends Notifier<AuthStatus> {
  @override
  AuthStatus build() {
    _checkInitialAuth();
    return AuthStatus.initial;
  }

  Future<void> _checkInitialAuth() async {
    final token = await ref.read(authServiceProvider).checkToken();
    if (token != null) {
      final role = await ref.read(authServiceProvider).getUserRole();
      ref.read(userRoleProvider.notifier).setRole(role);
      state = AuthStatus.authenticated;
    } else {
      state = AuthStatus.unauthenticated;
    }
  }

  Future<void> login(String email, String password, UserRole role) async {
    await ref.read(authServiceProvider).login(email, password, role);
    ref.read(userRoleProvider.notifier).setRole(role);
    state = AuthStatus.authenticated;
  }

  Future<void> logout() async {
    await ref.read(authServiceProvider).logout();
    ref.read(userRoleProvider.notifier).setRole(null);
    state = AuthStatus.unauthenticated;
  }
}

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthStatus>(
  AuthNotifier.new,
);