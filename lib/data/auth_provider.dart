import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_companion/models/auth_status.dart';
import 'package:school_companion/models/user_role.dart';
import 'package:school_companion/services/auth/auth_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

class AuthNotifier extends Notifier<AuthStatus> {
  @override
  AuthStatus build() {
    _checkInitialAuth();
    return AuthStatus.initial;
  }

  Future<void> _checkInitialAuth() async {
    final token = await ref.read(authServiceProvider).checkToken();
    if (token != null) {
      state = AuthStatus.authenticated;
    } else {
      state = AuthStatus.unauthenticated;
    }
  }

  Future<void> login(String email, String password, UserRole role) async {
    await ref.read(authServiceProvider).login(email, password, role);
    state = AuthStatus.authenticated;
  }

  Future<void> logout() async {
    await ref.read(authServiceProvider).logout();
    state = AuthStatus.unauthenticated;
  }
}

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthStatus>(
  AuthNotifier.new,
);