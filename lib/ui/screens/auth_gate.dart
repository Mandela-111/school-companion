import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_companion/data/auth_provider.dart';
import 'package:school_companion/models/auth_status.dart';
import 'package:school_companion/models/user_role.dart';
import 'package:school_companion/ui/screens/parent_dashboard.dart';
import 'package:school_companion/ui/screens/splash_screen.dart';
import 'package:school_companion/ui/screens/teacher_dashboard.dart';

import 'login_screen.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStatus = ref.watch(authNotifierProvider);
    final userRole = ref.watch(userRoleProvider);

    if (authStatus == AuthStatus.initial || (authStatus == AuthStatus.authenticated && userRole == null)) {
      return const SplashScreen();
    }

    if (authStatus == AuthStatus.unauthenticated) {
      return const LoginScreen();
    }

    if (userRole == UserRole.teacher) {
      return const TeacherDashboardScreen();
    }
    
    return const ParentDashboardScreen();
  }
}