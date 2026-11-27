import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_companion/data/auth_provider.dart';
import 'package:school_companion/models/user_role.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _isLoading = false;
  UserRole _selectedRole = UserRole.parent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Companion Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.school_outlined, size: 70, color: Colors.indigo),
            const SizedBox(height: 32),
            SegmentedButton<UserRole>(
              segments: const [
                ButtonSegment(value: UserRole.parent, label: Text('Parent')),
                ButtonSegment(value: UserRole.teacher, label: Text('Teacher')),
              ],
              selected: {_selectedRole},
              onSelectionChanged: (set) =>
                  setState(() => _selectedRole = set.first),
            ),
            const SizedBox(height: 24),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _isLoading
                  ? null
                  : () async {
                      setState(() => _isLoading = true);
                      await ref
                          .read(authNotifierProvider.notifier)
                          .login('user@school.com', '1234', _selectedRole);
                      if (mounted) setState(() => _isLoading = false);
                    },
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      _selectedRole == UserRole.parent
                          ? 'Log In as Parent'
                          : 'Log In as Teacher',
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
