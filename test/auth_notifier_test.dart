import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:school_companion/data/auth_provider.dart';
import 'package:school_companion/models/auth_status.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  FlutterSecureStorage.setMockInitialValues({});

  test('AuthNotifier initial state is AuthStatus.initial', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final status = container.read(authNotifierProvider);
    expect(status, AuthStatus.initial);
  });
}
